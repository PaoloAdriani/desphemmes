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
<div class="card">
    <#if "Y" == maySelectItems?default("N") && "PLACING_CUSTOMER" == roleTypeId!>
      <form method="post" id="sendMeThisEveryMonthForm" name="sendMeThisEveryMonthForm" action="<@ofbizUrl fullPath='true'>createShoppingListFromOrder</@ofbizUrl>">
        <input type="hidden" name="orderId" value="${orderHeader.orderId}"/>
        <input type="hidden" name="frequency" value="6"/>
        <input type="hidden" name="intervalNumber" value="1"/>
        <input type="hidden" name="shoppingListTypeId" value="SLT_AUTO_REODR"/>
      </form>
    </#if>
    <#if "Y" == maySelectItems?default("N")>
          <form name="addCommonToCartForm" action="<@ofbizUrl>addordertocart/orderstatus</@ofbizUrl>" method="post">
        <input type="hidden" name="add_all" value="false" />    
            <input type="hidden" name="orderId" value="${orderHeader.orderId}" />
    </#if>
  <div class="card-header">
    <strong>
    <#assign numColumns = 8>
    ${SystemLabelMap.OrderOrderItems}
    <#--
    <#if "Y" == maySelectItems?default("N") && "PLACING_CUSTOMER" == roleTypeId!>
      <#assign numColumns = 11>
      <a href="javascript:document.addCommonToCartForm.add_all.value='true';document.addCommonToCartForm.submit()"
          class="btn btn-sm float-right">${SystemLabelMap.OrderAddAllToCart}</a>
      <a href="javascript:document.addCommonToCartForm.add_all.value='false';document.addCommonToCartForm.submit()"
          class="btn btn-sm float-right">${SystemLabelMap.OrderAddCheckedToCart}</a>
      <button form="sendMeThisEveryMonthForm" class="btn btn-sm float-right" type="submit">${SystemLabelMap.OrderSendMeThisEveryMonth}</button>
    </#if>
    -->
    </strong>
  </div>
  <div class="card-body font-regular">
  <table class="table table-responsive-sm">
    <thead class="thead-light">
      <tr>
        <th>${SystemLabelMap.OrderProduct}</th>
        <#if "Y" == maySelectItems?default("N")>
          <th>${SystemLabelMap.OrderQtyOrdered}</th>
          <th>${SystemLabelMap.OrderQtyPicked}</th>
          <th>${SystemLabelMap.OrderQtyShipped}</th>
          <th>${SystemLabelMap.OrderQtyCanceled}</th>
        <#else>
          <th></th>
          <th></th>
          <th></th>
          <th>${SystemLabelMap.OrderQtyOrdered}</th>
        </#if>
          <th class="amount">${SystemLabelMap.EcommerceUnitPrice}</th>
          <th class="amount">${SystemLabelMap.OrderAdjustments}</th>
          <th class="amount">${SystemLabelMap.CommonSubTotal}</th>
        <#if "Y" == maySelectItems?default("N") && "PLACING_CUSTOMER" == roleTypeId!>
          <th colspan="3"></th>
        </#if>
      </tr>
    </thead>
    <tfoot>
      <tr>
        <th colspan="7">${SystemLabelMap.CommonSubTotal}</th>
        <td class="amount"><@ofbizCurrency amount=orderSubTotal isoCode=currencyUomId/></td>
        <#if "Y" == maySelectItems?default("N")>
          <td colspan="3"></td>
        </#if>
      </tr>
      <#list headerAdjustmentsToShow as orderHeaderAdjustment>
        <tr>
          <#--<th colspan="7">${localOrderReadHelper.getAdjustmentType(orderHeaderAdjustment)}</th>-->
          <th colspan="7">${SystemLabelMap.DiscountAndPromotions}</th>
          <td class="amount"><@ofbizCurrency amount=localOrderReadHelper.getOrderAdjustmentTotal(orderHeaderAdjustment) isoCode=currencyUomId/></td>
          <#if "Y" == maySelectItems?default("N")>
            <td colspan="3"></td>
          </#if>
        </tr>
      </#list>
      <tr>
        <th colspan="7">${SystemLabelMap.OrderShippingAndHandling}</th>
        <td class="amount"><@ofbizCurrency amount=orderShippingTotal isoCode=currencyUomId/></td>
        <#if "Y" == maySelectItems?default("N")>
          <td colspan="3"></td>
        </#if>
      </tr>

      <tr>
        <td colspan="3"></td>
        <#if "Y" == maySelectItems?default("N")>
          <td colspan="${numColumns - 6}"></td>
          <td colspan="3"></td>
        <#else>
          <td colspan="${numColumns - 3}"></td>
        </#if>
      </tr>
      <tr>
        <th colspan="7">${SystemLabelMap.OrderGrandTotal}</th>
        <td class="amount">
          <@ofbizCurrency amount=orderGrandTotal isoCode=currencyUomId/>
        </td>
        <#--
        <#if "Y" == maySelectItems?default("N")>
          <td colspan="3"></td>
        </#if>
        -->
      </tr>
    </tfoot>
    <tbody>
      <#list orderItems as orderItem>
        <#-- get info from workeffort and calculate rental quantity, if it was a rental item -->
        <#assign rentalQuantity = 1> <#-- no change if no rental item -->
        <#if "RENTAL_ORDER_ITEM" == orderItem.orderItemTypeId && workEfforts??>
          <#list workEfforts as workEffort>
            <#if workEffort.workEffortId == orderItem.orderItemSeqId>
              <#assign rentalQuantity = localOrderReadHelper.getWorkEffortRentalQuantity(workEffort)>
              <#assign workEffortSave = workEffort>
              <#break>
            </#if>
          </#list>
        <#else>
          <#assign WorkOrderItemFulfillments = orderItem.getRelated("WorkOrderItemFulfillment", null, null, false)!>
          <#if WorkOrderItemFulfillments?has_content>
            <#list WorkOrderItemFulfillments as WorkOrderItemFulfillment>
              <#assign workEffortSave = WorkOrderItemFulfillment.getRelatedOne("WorkEffort", true)!>
              <#break>
            </#list>
          </#if>
        </#if>
        <tr>
          <td colspan="${numColumns}"></td>
        </tr>
        <tr>
          <#if !orderItem.productId?? || "_?_" == orderItem.productId>
            <td>${orderItem.itemDescription?default("")}</td>
          <#else>
            <#assign product = orderItem.getRelatedOne("Product", true)!/> <#-- should always exist because of FK constraint, but just in case -->
            <td>
              <a href="<@ofbizCatalogAltUrl secure="false" productId=orderItem.productId/>"
                  class="linktext">${orderItem.productId} - ${orderItem.itemDescription?default("")}</a>
              <#assign orderItemAttributes = orderItem.getRelated("OrderItemAttribute", null, null, false)/>
              <#if orderItemAttributes?has_content>
                <ul class="list-unstyled">
                  <#list orderItemAttributes as orderItemAttribute>
                    <li>${orderItemAttribute.attrName} : ${orderItemAttribute.attrValue}</li>
                  </#list>
                </ul>
              </#if>
              <#if "Y" == maySelectItems?default("N")>
                <#assign returns = orderItem.getRelated("ReturnItem", null, null, false)!>
                <#if returns?has_content>
                  <#list returns as return>
                    <#assign returnHeader = return.getRelatedOne("ReturnHeader", false)>
                    <#if returnHeader.statusId != "RETURN_CANCELLED">
                      <#if "RETURN_REQUESTED" == returnHeader.statusId || "RETURN_APPROVED" == returnHeader.statusId>
                        <#assign displayState = "Return Pending">
                      <#else>
                        <#assign displayState = "Returned">
                      </#if>
                    ${displayState} (#${return.returnId})
                    </#if>
                  </#list>
                </#if>
              </#if>
            </td>
            <#if !("Y" == maySelectItems?default("N"))>
              <td></td>
              <td></td>
              <td></td>
            </#if>
            <td>
              ${orderItem.quantity?string.number}
            </td>
            <#if "Y" == maySelectItems?default("N")>
              <td>
                <#assign pickedQty = localOrderReadHelper.getItemPickedQuantityBd(orderItem)>
                <#if pickedQty gt 0 && "ORDER_APPROVED" == orderHeader.statusId>${pickedQty?default(0)?string.number}<#else>${pickedQty?default(0)?string.number}</#if>
              </td>
              <td>
                <#assign shippedQty = localOrderReadHelper.getItemShippedQuantity(orderItem)>
                ${shippedQty?default(0)?string.number}
              </td>
              <td>
                <#assign canceledQty = localOrderReadHelper.getItemCanceledQuantity(orderItem)>
                ${canceledQty?default(0)?string.number}
              </td>
            </#if>
            <td class="amount">
              <@ofbizCurrency amount=orderItem.unitPrice isoCode=currencyUomId/>
            </td>
            <td class="amount">
              <@ofbizCurrency amount=localOrderReadHelper.getOrderItemAdjustmentsTotal(orderItem) isoCode=currencyUomId/>
            </td>
            <td class="amount">
              <#if workEfforts??>
                  <@ofbizCurrency amount=localOrderReadHelper.getOrderItemTotal(orderItem)*rentalQuantity isoCode=currencyUomId/>
                <#else>
                <@ofbizCurrency amount=localOrderReadHelper.getOrderItemTotal(orderItem) isoCode=currencyUomId/>
              </#if>
            </td>
            <#--
            <#if "Y" == maySelectItems?default("N") && "PLACING_CUSTOMER" == roleTypeId!>
              <td></td>
              <td>
                <input name="item_id" value="${orderItem.orderItemSeqId}" type="checkbox"/>
              </td>
              <td></td>
            </#if>
            -->
          </#if>
        </tr>
        <#-- now cancel reason and comment field -->
        <#if "Y" == maySelectItems?default("N") && (orderHeader.statusId != "ORDER_SENT" && orderItem.statusId != "ITEM_COMPLETED" && orderItem.statusId != "ITEM_CANCELLED" && pickedQty == 0)>
          <tr>
            <td class="row"><label class="col-sm-3 col-form-label">${SystemLabelMap.OrderReturnReason}</label>
              <select name="irm_${orderItem.orderItemSeqId}" class="form-control custom-select col-sm-4">
                <option value=""></option>
                <#list orderItemChangeReasons as reason>
                  <option value="${reason.enumId}">${reason.get("description",locale)?default(reason.enumId)}</option>
                </#list>
              </select>
              <label class="col-sm-3 col-form-label">${SystemLabelMap.CommonComments}</label>
              <input class="form-control col-sm-2" type="text" name="icm_${orderItem.orderItemSeqId}" value="" size="30" maxlength="60"/>
            </td>
            <td>
              <a
                href="javascript:document.addCommonToCartForm.action='<@ofbizUrl>cancelOrderItem</@ofbizUrl>';document.addCommonToCartForm.submit()"
                class="d-inline-block mt-2">${SystemLabelMap.CommonCancel}</a>
              <input type="hidden" name="orderItemSeqId" value="${orderItem.orderItemSeqId}"/>
            </td>
          </tr>
        </#if>
        <#-- now show adjustment details per line item -->
        <#assign itemAdjustments = localOrderReadHelper.getOrderItemAdjustments(orderItem)>
        <#list itemAdjustments as orderItemAdjustment>
          <tr>
            <td>
            ${SystemLabelMap.EcommerceAdjustment}
              : ${StringUtil.wrapString(localOrderReadHelper.getAdjustmentType(orderItemAdjustment))}
              <#if orderItemAdjustment.description?has_content>
                : ${StringUtil.wrapString(orderItemAdjustment.description)}</#if>
            </td>
            <td colspan="5"></td>
            <td class="amount">
              <@ofbizCurrency amount=localOrderReadHelper.getOrderItemAdjustmentTotal(orderItem, orderItemAdjustment) isoCode=currencyUomId/>
            </td>
            <td></td>
            <#if "Y" == maySelectItems?default("N")>
              <td colspan="3"></td>
            </#if>
          </tr>
        </#list>
        <#-- show the order item ship group info -->
        <#--
        <#assign orderItemShipGroupAssocs = orderItem.getRelated("OrderItemShipGroupAssoc", null, null, false)!>
        <#if orderItemShipGroupAssocs?has_content>
          <#list orderItemShipGroupAssocs as shipGroupAssoc>
            <#assign shipGroup = shipGroupAssoc.getRelatedOne("OrderItemShipGroup", false)!>
            <#assign shipGroupAddress = (shipGroup.getRelatedOne("PostalAddress", false))!>
            <tr>
              <td>
              ${SystemLabelMap.OrderShipGroup}: [${shipGroup.shipGroupSeqId}] ${shipGroupAddress.address1?default("N/A")}
              </td>
              <td>
              ${shipGroupAssoc.quantity?string.number}
              </td>
              <td colspan="${numColumns - 2}"></td>
            </tr>
          </#list>
        </#if>
        -->
      </#list>
      <#if orderItems?size == 0 || !orderItems?has_content>
      <tr>
        <td colspan="${numColumns}">${SystemLabelMap.OrderSalesOrderLookupFailed}</td>
      </tr>
      </#if>
      <tr>
        <td colspan="${numColumns}"></td>
      </tr>
    </tbody>
  </table>
    <#if "Y" == maySelectItems?default("N") >
        </form>
     </#if>
     </div>
</div>