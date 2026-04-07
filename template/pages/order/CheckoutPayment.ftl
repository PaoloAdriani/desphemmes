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
<title>Des Phemmes | Checkout - ${SystemLabelMap.OrderHowShallYouPay}</title>

</#macro>

<#macro page_body>

<section id="content">
    <div class="content-wrap">
        <div class="container">
            <div class="alert alert-danger" id="paymentError" style="display:none; text-align: center;">
                <i class="bi-x-circle-fill"></i><strong>${SystemLabelMap.AttentionMessage}!</strong>&nbsp;${SystemLabelMap.SelectPaymentMethodType}
            </div>
            <div class="card mb-0">
            <#assign cart = shoppingCart! />
            <form method="post" id="checkoutInfoForm" action="">
                <input type="hidden" name="checkoutpage" value="payment" />
                <input type="hidden" name="BACK_PAGE" value="checkoutoptions" />
                <input type="hidden" name="issuerId" id="issuerId" value="" />
                <input type="hidden" name="csrf" value="${Static['org.apache.ofbiz.security.CsrfUtil'].generateTokenForNonAjax(request, 'checkoutOptions')}"/>

                <div class="card">
                    <h4 class="card-header upper">
                      3 -&nbsp;${SystemLabelMap.OrderHowShallYouPay}?
                    </h4>
                    <div class="card-body">
                        <#-- Payment Method Selection -->
                        <div>
                          <label>${SystemLabelMap.CommonSelect}:</label>
                          <#if productStorePaymentMethodTypeIdMap.EXT_OFFLINE??>
                          </div>
                          <div class="form-check">
                              <input type="radio" class="form-check-input" id="checkOutPaymentId_OFFLINE" name="checkOutPaymentId" value="EXT_OFFLINE" <#if "EXT_OFFLINE" == checkOutPaymentId>checked="checked"</#if>/>
                              <label for="checkOutPaymentId_OFFLINE">${SystemLabelMap.OrderMoneyOrder}</label>
                          </div>
                          </#if>
                          <#if productStorePaymentMethodTypeIdMap.EXT_PAYPAL??>
                          <div class="form-check">
                              <input class="form-check-input" type="radio" id="checkOutPaymentId_PAYPAL" name="checkOutPaymentId" value="EXT_PAYPAL" <#if "EXT_PAYPAL" == checkOutPaymentId>checked="checked"</#if> />
                              <label for="checkOutPaymentId_PAYPAL">${SystemLabelMap.AccountingPayWithPayPal}</label>
                          </div>
                          </#if>
                          <#if productStorePaymentMethodTypeIdMap.EXT_UNICREDIT_CC??>
                            <div class="form-check">
                                <input class="form-check-input" type="radio" id="checkOutPaymentId_UNICREDIT" name="checkOutPaymentId" value="EXT_UNICREDIT_CC" <#if "EXT_UNICREDIT_CC" == checkOutPaymentId>checked="checked"</#if> />
                                <label for="checkOutPaymentId_UNICREDIT">${SystemLabelMap.AccountingPayWithUnicredit}</label>
                            </div>
                          </#if>
                    </div>
                </div>
            </form>

            <div class="row py-2 col-mb-30">
                <div class="col d-flex justify-content-lg-start justify-content-center">
                    <a href="#" class="button button-small button-3d button-black m-0 upper js-submit" data-url="<@ofbizUrl>updateCheckoutOptions/showCart</@ofbizUrl>"><i class="bi-arrow-left"></i>&nbsp;${SystemLabelMap.OrderBacktoShoppingCart}</a>
                </div>
                <div class="col d-flex justify-content-lg-end justify-content-center">
                    <a href="#" class="button button-small button-3d button-black m-0 upper js-submit" data-url="<@ofbizUrl>checkoutOptions</@ofbizUrl>">${SystemLabelMap.OrderContinueToFinalOrderReview}&nbsp;<i class="bi-arrow-right"></i></a>
                </div>
            </div>
        </div>
    </div>
</div>
</section>

</#macro>
<@display_page/>