/*
 * Licensed to the Apache Software Foundation (ASF) under one
 * or more contributor license agreements.  See the NOTICE file
 * distributed with this work for additional information
 * regarding copyright ownership.  The ASF licenses this file
 * to you under the Apache License, Version 2.0 (the
 * "License"); you may not use this file except in compliance
 * with the License.  You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing,
 * software distributed under the License is distributed on an
 * "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 * KIND, either express or implied.  See the License for the
 * specific language governing permissions and limitations
 * under the License.
*/
package desphemmes.invoice

import org.apache.ofbiz.accounting.invoice.InvoiceWorker
import org.apache.ofbiz.base.util.UtilValidate
import org.apache.ofbiz.entity.GenericValue
import org.apache.ofbiz.entity.util.EntityUtil
import org.apache.ofbiz.order.order.OrderReadHelper
import org.apache.ofbiz.party.party.PartyWorker

import java.text.DateFormat

import org.apache.ofbiz.base.util.UtilNumber

invoiceId = parameters.get('invoiceId')

invoice = from('Invoice').where('invoiceId', invoiceId).queryOne()
context.invoice = invoice

currency = parameters.currency // allow the display of the invoice in the original currency,
                               // the default is to display the invoice in the default currency
BigDecimal conversionRate = new BigDecimal('1')
decimals = UtilNumber.getBigDecimalScale('invoice.decimals')
rounding = UtilNumber.getBigDecimalRoundingMode('invoice.rounding')

if (invoice) {
    // each invoice of course has two billing addresses, but the one that is relevant for purchase invoices is the PAYMENT_LOCATION of the invoice
    // (ie Accounts Payable address for the supplier), while the right one for sales invoices is the BILLING_LOCATION (ie Accounts Receivable or
    // home of the customer.)
    if (invoice.invoiceTypeId == 'PURCHASE_INVOICE') {
        billingAddress = InvoiceWorker.getSendFromAddress(invoice)
    } else {
        billingAddress = InvoiceWorker.getBillToAddress(invoice)
    }
    if (billingAddress) {
        context.billingAddress = billingAddress
    }
    billToParty = InvoiceWorker.getBillToParty(invoice)
    context.billToParty = billToParty
    sendingParty = InvoiceWorker.getSendFromParty(invoice)
    context.sendingParty = sendingParty
    shippingAddress = InvoiceWorker.getShippingAddress(invoice)
    context.shippingAddress = shippingAddress

    if (currency && invoice.getString('currencyUomId') != currency) {
        conversionRate = InvoiceWorker.getInvoiceCurrencyConversionRate(invoice)
        invoice.currencyUomId = currency
        invoice.invoiceMessage = ' converted from original with a rate of: ' + conversionRate.setScale(8, rounding)
    }

    invoiceItems = invoice.getRelated('InvoiceItem', null, ['invoiceItemSeqId'], false)
    invoiceItemsConv = []
    vatTaxesByType = [:]
    invoiceItems.each { invoiceItem ->
        invoiceItem.amount = (invoiceItem.getBigDecimal('amount') * conversionRate).setScale(decimals, rounding)
        invoiceItemsConv.add(invoiceItem)
        // get party tax id for VAT taxes: they are required in invoices by EU
        // also create a map with tax grand total amount by VAT tax: it is also required in invoices by UE
        taxRate = invoiceItem.getRelatedOne('TaxAuthorityRateProduct', false)
        if (taxRate && taxRate.taxAuthorityRateTypeId == 'VAT_TAX') {
            taxInfo = from('PartyTaxAuthInfo')
                .where('partyId', billToParty.partyId, 'taxAuthGeoId', taxRate.taxAuthGeoId, 'taxAuthPartyId', taxRate.taxAuthPartyId)
                .filterByDate(invoice.invoiceDate)
                .queryFirst()
            if (taxInfo) {
                context.billToPartyTaxId = taxInfo.partyTaxId
            }
            taxInfo = from('PartyTaxAuthInfo')
                .where('partyId', sendingParty.partyId, 'taxAuthGeoId', taxRate.taxAuthGeoId, 'taxAuthPartyId', taxRate.taxAuthPartyId)
                .filterByDate(invoice.invoiceDate)
                .queryFirst()
            if (taxInfo) {
                context.sendingPartyTaxId = taxInfo.partyTaxId
            }
            vatTaxesByTypeAmount = vatTaxesByType[taxRate.taxAuthorityRateSeqId] ?: 0.0
            vatTaxesByType.put(taxRate.taxAuthorityRateSeqId, vatTaxesByTypeAmount + invoiceItem.amount)
        }
    }
    context.vatTaxesByType = vatTaxesByType
    context.vatTaxIds = vatTaxesByType.keySet().asList()

    context.invoiceItems = invoiceItemsConv

    invoiceTotal = (InvoiceWorker.getInvoiceTotal(invoice) * conversionRate).setScale(decimals, rounding)
    invoiceNoTaxTotal = (InvoiceWorker.getInvoiceNoTaxTotal(invoice) * conversionRate).setScale(decimals, rounding)
    context.invoiceTotal = invoiceTotal
    context.invoiceNoTaxTotal = invoiceNoTaxTotal

    //*________________this snippet was added for adding Tax ID in invoice header if needed _________________

    sendingTaxInfos = sendingParty.getRelated('PartyTaxAuthInfo', null, null, false)
    billingTaxInfos = billToParty.getRelated('PartyTaxAuthInfo', null, null, false)
    sendingPartyTaxId = null
    billToPartyTaxId = null

    if (billingAddress) {
        sendingTaxInfos.eachWithIndex { sendingTaxInfo, i ->
            if (sendingTaxInfo.taxAuthGeoId == billingAddress.countryGeoId) {
                sendingPartyTaxId = sendingTaxInfos[i - 1].partyTaxId
            }
        }
        billingTaxInfos.eachWithIndex { billingTaxInfo, i ->
            if (billingTaxInfo.taxAuthGeoId == billingAddress.countryGeoId) {
                billToPartyTaxId = billingTaxInfos[i - 1].partyTaxId
            }
        }
    }
    if (sendingPartyTaxId) {
        context.sendingPartyTaxId = sendingPartyTaxId
    }
    if (billToPartyTaxId && !context.billToPartyTaxId) {
        context.billToPartyTaxId = billToPartyTaxId
    }
    //________________this snippet was added for adding Tax ID in invoice header if needed _________________*/

    terms = invoice.getRelated('InvoiceTerm', null, null, false)
    context.terms = terms

    paymentAppls = from('PaymentApplication').where('invoiceId', invoiceId).queryList()
    context.payments = paymentAppls

    orderItemBillings = from('OrderItemBilling').where('invoiceId', invoiceId).orderBy('orderId').queryList()
    orders = new LinkedHashSet()
    orderItemBillings.each { orderIb ->
        orders.add(orderIb.orderId)
    }
    context.orders = orders

    invoiceStatus = invoice.getRelatedOne('StatusItem', false)
    context.invoiceStatus = invoiceStatus

    edit = parameters.editInvoice
    if ('true'.equalsIgnoreCase(edit)) {
        invoiceItemTypes = from('InvoiceItemType').queryList()
        context.invoiceItemTypes = invoiceItemTypes
        context.editInvoice = true
    }

    // format the date
    if (invoice.invoiceDate) {
        invoiceDate = DateFormat.getDateInstance(DateFormat.LONG).format(invoice.invoiceDate)
        context.invoiceDate = invoiceDate
    } else {
        context.invoiceDate = 'N/A'
    }

    //@mpstyle custom informations and data
    partyTelecomNumber = PartyWorker.findPartyLatestTelecomNumber(billToParty?.getString("partyId"), delegator)
    context.phone = partyTelecomNumber?.contactNumber

    //from the orders retrieve the emails
    Map orderEmailMap = [:]
    def mainOrderId = ""
    if (orders) {
        mainOrderId = orders.iterator().next()
        for (String orderId : orders) {
            OrderReadHelper orh = new OrderReadHelper(delegator, orderId)
            def orderEmail = orh.getOrderEmailString()
            orderEmailMap[orderId] = orderEmail
        }
    }
    context.orderEmailMap = orderEmailMap

    //retrieve the invoice payment date if exists or retireve the order approved date if exists
    def invoicePaymentDate = null
    OrderReadHelper orh = new OrderReadHelper(delegator, mainOrderId)
    if (invoice.paidDate) {
        invoicePaymentDate = invoice.paidDate
    } else {
        List<String> orderStatusList = orh?.getOrderStatuses()
        for(GenericValue stat : orderStatusList)
        {
            def statusId = stat.getString("statusId")
            if(statusId.equals("ORDER_APPROVED")) {
                if(stat.statusDatetime != null) {
                    invoicePaymentDate = stat.statusDatetime
                } else {
                    if(statusId.equals("ORDER_COMPLETED")) {
                        invoicePaymentDate = stat?.statusDatetime ?: invoice.invoiceDate
                    }
                }
            }
        }
    }
    context.invoicePaymentDate = invoicePaymentDate

    //Main order creation date
    def mainOrderCreationDate = null
    GenericValue orderHeader = orh.getOrderHeader()
    if(orderHeader) {
        mainOrderCreationDate = orderHeader.getTimestamp("orderDate")
    }
    context.mainOrderCreationDate = mainOrderCreationDate

    //Main order payment method
    def mainOrderPaymentMethodId = null
    def mainOrderPaymentMethodDesc = null
    List<GenericValue> orderPaymentPreferences = orh?.getPaymentPreferences()
    if (orderPaymentPreferences) {
        for(GenericValue opp : orderPaymentPreferences) {
            if(UtilValidate.isNotEmpty(mainOrderPaymentMethodId)) {
                break
            }
            //check external payment first
            def paymentMethodTypeId = opp.getString("paymentMethodTypeId")
            if (paymentMethodTypeId.startsWith(("EXT_"))) {
                mainOrderPaymentMethodId = paymentMethodTypeId.substring("EXT_".length())
                GenericValue paymentMethodType = opp.getRelatedOne("PaymentMethodType", true)
                mainOrderPaymentMethodDesc = paymentMethodType?.description ?: mainOrderPaymentMethodId
            }
        }

        if(UtilValidate.isEmpty(mainOrderPaymentMethodId)) {
            GenericValue firstPaymentMethod = EntityUtil.getFirst(orderPaymentPreferences)
            if (firstPaymentMethod) {
                mainOrderPaymentMethodId = firstPaymentMethod.getString("paymentMethodTypeId")
                GenericValue paymentMethodType = firstPaymentMethod.getRelatedOne("PaymentMethodType", true)
                mainOrderPaymentMethodDesc = paymentMethodType?.description ?: mainOrderPaymentMethodId
            }
        }

    }
    context.mainOrderPaymentMethodId = mainOrderPaymentMethodId
    context.mainOrderPaymentMethodDesc = mainOrderPaymentMethodDesc

    //Build a map of invoiceItem products with size and color descriptions
    Map<String, Map<String, String>> invoiceItemProductSizeColorMap = [:]
    invoiceItems.each { invoiceItem ->
        def productId = invoiceItem.getString("productId")
        if (productId) {
            List<GenericValue> productFeatureAndApplList = from("ProductFeatureAndAppl")
                    .where("productId", productId, "productFeatureApplTypeId", "STANDARD_FEATURE")
                    .cache(true).queryList()
            if (productFeatureAndApplList) {
                def colorFeatureAppl = productFeatureAndApplList.find { it.getString("productFeatureTypeId") == "COLOR" }
                def sizeFeatureAppl = productFeatureAndApplList.find { it.getString("productFeatureTypeId") == "SIZE" }
                def featureDescriptionMap= invoiceItemProductSizeColorMap.get(productId) ?: [:]
                if (colorFeatureAppl) {
                    def colorFeatureId = colorFeatureAppl.getString("productFeatureId")
                    def colorFeatureDescription = colorFeatureAppl.getString("description") ?: colorFeatureId
                    featureDescriptionMap.put("COLOR", colorFeatureDescription)
                }
                if (sizeFeatureAppl) {
                    def sizeFeatureId = sizeFeatureAppl.getString("productFeatureId")
                    def sizeFeatureDescription = sizeFeatureAppl.getString("description") ?: sizeFeatureId
                    featureDescriptionMap.put("SIZE", sizeFeatureDescription)
                }
                if (featureDescriptionMap) {
                    invoiceItemProductSizeColorMap.put(productId, featureDescriptionMap)
                }
            }
        }
    }
    context.invoiceItemProductSizeColorMap = invoiceItemProductSizeColorMap

}
