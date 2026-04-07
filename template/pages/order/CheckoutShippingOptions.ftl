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
<#include "../base.ftl"/>

<#macro page_head_title>

<!-- Document Title
============================================= -->
<title>Des Phemmes | Checkout - ${SystemLabelMap.OrderHowShallWeShipIt}</title>

</#macro>

<#macro page_body>

<section id="content">
    <div class="content-wrap">
        <div class="container">
            <div class="card mb-0">
                <form method="post" name="checkoutInfoForm" style="margin:0;">
                  <fieldset>
                    <input type="hidden" name="checkoutpage" value="shippingoptions"/>
                    <div class="card">
                      <h4 class="card-header upper">
                        2 -&nbsp;${SystemLabelMap.OrderHowShallWeShipIt}
                      </h4>
                      <div class="card-body">
                        <#list carrierShipmentMethodList as carrierShipmentMethod>
                          <#assign shippingMethod = carrierShipmentMethod.shipmentMethodTypeId + "@" + carrierShipmentMethod.partyId>
                          <div class="form-check">
                            <input class="form-check-input" type="radio" id="shipping_method_${carrierShipmentMethod?index}" name="shipping_method" value="${shippingMethod}"
                            <#if shippingMethod == StringUtil.wrapString(chosenShippingMethod!"N@A")>checked="checked"</#if>/>
                            <#if shoppingCart.getShippingContactMechId()??>
                              <#assign shippingEst = shippingEstWpr.getShippingEstimate(carrierShipmentMethod)?default(-1)>
                            </#if>
                            <label class="form-check-label" for="shipping_method_${carrierShipmentMethod?index}">
                            <#if carrierShipmentMethod.partyId != "_NA_"><#--${carrierShipmentMethod.partyId!}-->
                              &nbsp;</#if>${carrierShipmentMethod.description!}
                            <#--
                            <#if shippingEst?has_content> -
                              <#if (shippingEst > -1)>
                                <@ofbizCurrency amount=shippingEst isoCode=shoppingCart.getCurrency()/>
                              <#else>
                                ${SystemLabelMap.OrderCalculatedOffline}
                              </#if>
                            </#if>
                            -->
                            </label>
                          </div>
                        </#list>
                        <#if !carrierShipmentMethodList?? || carrierShipmentMethodList?size == 0>
                          <div class="form-check">
                          <input type="radio" name="shipping_method" class="form-check-input" value="Default" checked="checked"/>
                          <label class="form-check-label" for="shipping_method">${SystemLabelMap.OrderUseDefault}.</label>
                          </div>
                        </#if>
                    </div>
                  </fieldset>
                </form>
                <div class="row py-2 col-mb-30">
                    <div class="col d-flex justify-content-lg-start justify-content-center">
                      <a href="#" class="button button-small button-3d button-black m-0 upper js-submit" data-url="<@ofbizUrl>updateCheckoutOptions/showCart</@ofbizUrl>"><i class="bi-arrow-left"></i>&nbsp;${SystemLabelMap.OrderBacktoShoppingCart}</a>
                  </div>
                    <div class="col d-flex justify-content-lg-end justify-content-center">
                      <a href="#" class="button button-small button-3d button-black m-0 upper js-submit" data-url="<@ofbizUrl>checkoutOptions</@ofbizUrl>">${SystemLabelMap.CommonNext}&nbsp;<i class="bi-arrow-right"></i></a>
                  </div>
                </div>
            </div>
        </div>
    </div>
</section>

</#macro>
<@display_page/>