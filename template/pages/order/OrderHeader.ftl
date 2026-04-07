<#--
Licensed to the Apache Software Foundation (ASF) under one
or more contributor license agreements.  See the NOTICE file
distributed with this work for additional information
regarding copyright ownership.  The ASF licenses this file
to you under the Apache License, Version 2.0 (the
"License"); you may not use this file except in compliance
with the License.  You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing,
software distributed under the License is distributed on an
"AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
KIND, either express or implied.  See the License for the
specific language governing permissions and limitations
under the License.
-->

<#-- NOTE: this template is used for the orderstatus screen in ecommerce AND for order notification emails through the OrderNoticeEmail.ftl file -->
<#-- the "urlPrefix" value will be prepended to URLs by the ofbizUrl transform if/when there is no "request" object in the context -->
<#if baseEcommerceSecureUrl??><#assign urlPrefix = baseEcommerceSecureUrl/></#if>
<#if (orderHeader.externalId)?? && (orderHeader.externalId)?has_content >
  <#assign externalOrder = "(" + orderHeader.externalId + ")"/>
</#if>

    <div class="card">
      <div class="card-header">
        <strong>
        <#if "Y" == maySelectItems?default("N") && "Y" == returnLink?default("N") && "ORDER_COMPLETED" == (orderHeader.statusId)! && "PLACING_CUSTOMER" == roleTypeId!>
          <a href="<@ofbizUrl fullPath="true">makeReturn?orderId=${orderHeader.orderId}</@ofbizUrl>"
              class="button">${SystemLabelMap.OrderRequestReturn}</a>
        </#if>
        ${SystemLabelMap.OrderOrder}
        <#if orderHeader?has_content>
          ${SystemLabelMap.CommonNbr}
          <a href="<@ofbizUrl fullPath="true">orderstatus?orderId=${orderHeader.orderId}</@ofbizUrl>"
              class="btn btn-sm">${orderHeader.orderId}</a>
        </#if>
        <#--
        ${SystemLabelMap.CommonInformation}
        <#if (orderHeader.orderId)??>
          ${externalOrder!} [ <a href="<@ofbizUrl fullPath="true">order.pdf?orderId=${(orderHeader.orderId)!}</@ofbizUrl>"
              target="_BLANK" class="btn btn-sm">PDF</a> ]
        </#if>
        </strong>
        -->
      </div>
      <div class="card-body font-regular">
        <#-- placing customer information -->
        <ul class="list-unstyled">
          <#if localOrderReadHelper?? && orderHeader?has_content>
            <#assign displayParty = localOrderReadHelper.getPlacingParty()!/>
            <#if displayParty?has_content>
              <#assign displayPartyNameResult = dispatcher.runSync("getPartyNameForDate", Static["org.apache.ofbiz.base.util.UtilMisc"].toMap("partyId", displayParty.partyId, "compareDate", orderHeader.orderDate, "userLogin", userLogin))/>
            </#if>
            <li>
              ${SystemLabelMap.PartyName} :
              ${(displayPartyNameResult.fullName)?default("[Name Not Found]")}
            </li>
          </#if>
          <#-- order status information -->
          <li>
            ${SystemLabelMap.CommonStatus} :
            <#if orderHeader?has_content>
              ${localOrderReadHelper.getStatusString(locale)}
            <#else>
              ${SystemLabelMap.OrderNotYetOrdered}
            </#if>
          </li>
          <#-- ordered date -->
          <#if orderHeader?has_content>
            <li>
              ${SystemLabelMap.CommonDate} :
              ${orderHeader.orderDate.toString()}
            </li>
          </#if>
          <#if distributorId??>
            <li>
              ${SystemLabelMap.OrderDistributor} :
              ${distributorId}
            </li>
          </#if>
        </ul>
      </div>
    </div>

    <div class="card">
      <#if paymentMethods?has_content || paymentMethodType?has_content || billingAccount?has_content>
        <#-- order payment info -->
        <div class="card-header">
          <strong>${SystemLabelMap.AccountingPaymentInformation}</strong>
        </div>
        <#-- offline payment address infomation :: change this to use Company's address -->
        <div class="card-body font-regular">
          <ul class="list-unstyled">
            <#if !paymentMethod?has_content && paymentMethodType?has_content>
              <li>
                <#if "EXT_OFFLINE" == paymentMethodType.paymentMethodTypeId>
                  ${SystemLabelMap.AccountingOfflinePayment}
                  <#if orderHeader?has_content && paymentAddress?has_content>
                    ${SystemLabelMap.OrderSendPaymentTo}:
                    <#if paymentAddress.toName?has_content>${paymentAddress.toName}</#if>
                    <#if paymentAddress.attnName?has_content>
                      ${SystemLabelMap.PartyAddrAttnName}  : ${paymentAddress.attnName}
                    </#if>
                    ${paymentAddress.address1}
                    <#if paymentAddress.address2?has_content>${paymentAddress.address2}</#if>
                    <#assign paymentStateGeo = (delegator.findOne("Geo", {"geoId", paymentAddress.stateProvinceGeoId!}, false))! />
                    ${paymentAddress.city}
                    <#if paymentStateGeo?has_content>, ${paymentStateGeo.geoName!}</#if>
                    ${paymentAddress.postalCode!}
                    <#assign paymentCountryGeo = (delegator.findOne("Geo", {"geoId", paymentAddress.countryGeoId!}, false))! />
                    <#if paymentCountryGeo?has_content>${paymentCountryGeo.geoName!}</#if>
                    ${SystemLabelMap.EcommerceBeSureToIncludeYourOrderNb}
                  </#if>
                <#else>
                  <#assign outputted = true>
                  ${SystemLabelMap.AccountingPaymentVia}: ${paymentMethodType.get("description",locale)}
                </#if>
              </li>
            </#if>
            <#if paymentMethods?has_content>
              <#list paymentMethods as paymentMethod>
                <#if "CREDIT_CARD" == paymentMethod.paymentMethodTypeId>
                  <#assign creditCard = paymentMethod.getRelatedOne("CreditCard", false)>
                  <#assign formattedCardNumber = Static["org.apache.ofbiz.party.contact.ContactHelper"].formatCreditCard(creditCard)>
                <#elseif "GIFT_CARD" == paymentMethod.paymentMethodTypeId>
                  <#assign giftCard = paymentMethod.getRelatedOne("GiftCard", false)>
                <#elseif "EFT_ACCOUNT" == paymentMethod.paymentMethodTypeId>
                  <#assign eftAccount = paymentMethod.getRelatedOne("EftAccount", false)>
                </#if>
                <#if pmBillingAddress?has_content>
                  <li>
                    <ul class="list-unstyled">
                      <li>
                        <#if pmBillingAddress.toName?has_content>${SystemLabelMap.CommonTo}: ${pmBillingAddress.toName}</#if>
                      </li>
                      <li>
                        <#if pmBillingAddress.attnName?has_content>
                          ${SystemLabelMap.PartyAddrAttnName}  : ${pmBillingAddress.attnName}
                        </#if>
                      </li>
                      <li>
                        ${pmBillingAddress.address1}
                      </li>
                      <li>
                        <#if pmBillingAddress.address2?has_content>${pmBillingAddress.address2}</#if>
                      </li>
                      <li>
                        <#assign pmBillingStateGeo = (delegator.findOne("Geo", {"geoId", pmBillingAddress.stateProvinceGeoId!}, false))! />
                        ${pmBillingAddress.city}
                        <#if pmBillingStateGeo?has_content>  , ${ pmBillingStateGeo.geoName!}</#if>
                        ${pmBillingAddress.postalCode!}
                        <#assign pmBillingCountryGeo = (delegator.findOne("Geo", {"geoId", pmBillingAddress.countryGeoId!}, false))! />
                        <#if pmBillingCountryGeo?has_content>${pmBillingCountryGeo.geoName!}</#if>
                      </li>
                    </ul>
                  </li>
                </#if>
                <#assign outputted = true>
              </#list>
            </#if>
            <#-- billing account info -->
            <#if billingAccount?has_content>
              <#if outputted?default(false)></#if>
              <#assign outputted = true>
              <li>
                ${SystemLabelMap.AccountingBillingAccount}
                #${billingAccount.billingAccountId!} - ${billingAccount.description!}
              </li>
            </#if>
            <#if (customerPoNumberSet?has_content)>
              <li>
                ${SystemLabelMap.OrderPurchaseOrderNumber}
                <#list customerPoNumberSet as customerPoNumber>
                  ${customerPoNumber!}
                </#list>
              </li>
            </#if>
          </ul>
        </div>
      </#if>
    </div>

  <div class="card">
    <#if orderItemShipGroups?has_content>
      <div class="card-header">
        <strong>${SystemLabelMap.OrderShippingInformation}</strong>
      </div>
      <div class="card-body font-regular">
      <#-- shipping address -->
      <#assign groupIdx = 0>

      <#list orderItemShipGroups as shipGroup>
        <#if orderHeader?has_content>
          <#assign shippingAddress = shipGroup.getRelatedOne("PostalAddress", false)!>
          <#assign groupNumber = shipGroup.shipGroupSeqId!>
        <#else>
          <#assign shippingAddress = cart.getShippingAddress(groupIdx)!>
          <#assign groupNumber = groupIdx + 1>
        </#if>
        <ul class="list-unstyled">
          <#if shippingAddress?has_content>
            <li>
              <ul class="list-unstyled">
                <li>
                  <b>${SystemLabelMap.OrderDestination} <#--[${groupNumber}]-->
                  <#if shippingAddress.toName?has_content>${SystemLabelMap.CommonTo}:</b> ${shippingAddress.toName}</#if>
                </li>
                <li>
                  <#if shippingAddress.attnName?has_content>
                    <b>${SystemLabelMap.PartyAddrAttnName}:</b> ${shippingAddress.attnName}
                  </#if>
                </li>
                <li>
                  ${shippingAddress.address1}
                </li>
                <li>
                  <#if shippingAddress.address2?has_content>${shippingAddress.address2}</#if>
                </li>
                <li>
                  <#assign shippingStateGeo = (delegator.findOne("Geo", {"geoId", shippingAddress.stateProvinceGeoId!}, false))! />
                  ${shippingAddress.city}
                  <#if shippingStateGeo?has_content>, ${shippingStateGeo.geoName!}</#if>
                  ${shippingAddress.postalCode!}
                </li>
                <li>
                  <#assign shippingCountryGeo = (delegator.findOne("Geo", {"geoId", shippingAddress.countryGeoId!}, false))! />
                  <#if shippingCountryGeo?has_content>${shippingCountryGeo.geoName!}</#if>
                </li>
              </ul>
            </li>
          </#if>
          <li>
            <ul class="list-unstyled">
              <li>
                <b>${SystemLabelMap.OrderMethod}:</b>
                <#if orderHeader?has_content>
                  <#assign shipmentMethodType = shipGroup.getRelatedOne("ShipmentMethodType", false)!>
                  <#assign carrierPartyId = shipGroup.carrierPartyId!>
                <#else>
                  <#assign shipmentMethodType = cart.getShipmentMethodType(groupIdx)!>
                  <#assign carrierPartyId = cart.getCarrierPartyId(groupIdx)!>
                </#if>
                <#if carrierPartyId?? && carrierPartyId != "_NA_">${carrierPartyId!}</#if>
                ${(shipmentMethodType.description)?default("N/A")}
              </li>
              <li>
                <#if shippingAccount??>${SystemLabelMap.AccountingUseAccount}: ${shippingAccount}</#if>
              </li>
            </ul>
          </li>
        </ul>
        <#assign groupIdx = groupIdx + 1>
      </#list><#-- end list of orderItemShipGroups -->
      </div>
    </#if>
  </div>

