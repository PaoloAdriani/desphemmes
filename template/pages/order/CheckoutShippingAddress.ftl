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
                <#assign cart = shoppingCart!/>
                <form method="post" name="checkoutInfoForm" style="margin:0;">
                    <input type="hidden" name="checkoutpage" value="shippingaddress"/>
                    <div class="card">
                        <h5 class="card-header upper">1 -&nbsp;${SystemLabelMap.OrderWhereShallWeShipIt}?</h5>
                        <div class="card-body">
                            <table class="table table-responsive-sm">
                              <tr>
                                <td colspan="2">
                                    <a href="#" class="button button-small button-3d button-black m-0 upper js-submit" data-url="<@ofbizUrl>updateCheckoutOptions/editcontactmech?preContactMechTypeId=POSTAL_ADDRESS&contactMechPurposeTypeId=SHIPPING_LOCATION&DONE_PAGE=checkoutOptions</@ofbizUrl>">${SystemLabelMap.PartyAddNewAddress}&nbsp; <i class="bi-journal-plus"></i></a>
                                </td>
                              </tr>
                               <#if shippingContactMechList?has_content>
                                 <#list shippingContactMechList as shippingContactMech>
                                   <#assign shippingAddress = shippingContactMech.getRelatedOne("PostalAddress", false)>
                                   <#if shippingAddress.countryGeoId?has_content && shippingAddress.countryGeoId == currentShippingCountry>
                                        <#assign checkThisAddress = (shippingContactMech_index == 0 && !cart.getShippingContactMechId()?has_content) || (cart.getShippingContactMechId()?default("") == shippingAddress.contactMechId)/>
                                       <tr>
                                         <td>
                                         <div class="row form-check d-flex">
                                            <div class="col-md-6 col-xs-12">
                                                <input type="radio" class="form-check-input" name="shipping_contact_mech_id" value="${shippingAddress.contactMechId}"<#if checkThisAddress> checked="checked"</#if> />
                                                <label>
                                                 <#if shippingAddress.toName?has_content><b>${SystemLabelMap.CommonTo}:</b>&nbsp;${shippingAddress.toName}<br /></#if>
                                                 <#if shippingAddress.attnName?has_content><b>${SystemLabelMap.PartyAddrAttnName}:</b>&nbsp;${shippingAddress.attnName}<br /></#if>
                                                 <#if shippingAddress.address1?has_content>${shippingAddress.address1},</#if>
                                                 <#if shippingAddress.address2?has_content>${shippingAddress.address2}<br /></#if>
                                                 <#if shippingAddress.city?has_content>${shippingAddress.city}</#if>
                                                 <#if shippingAddress.stateProvinceGeoId?has_content>${shippingAddress.stateProvinceGeoId}</#if>
                                                 <#if shippingAddress.postalCode?has_content><br />${shippingAddress.postalCode}</#if>
                                                 <#if shippingAddress.countryGeoId?has_content><br />${shippingAddress.countryGeoId}</#if>
                                                </label>
                                            </div>
                                             <div class="col-md-6 col-xs-12">
                                                <a href="#" class="button button-small button-3d button-black m-0 upper js-submit" data-url="<@ofbizUrl>updateCheckoutOptions/editcontactmech?DONE_PAGE=checkoutOptions&contactMechId=${shippingAddress.contactMechId}</@ofbizUrl>">${SystemLabelMap.CommonUpdateAddress}&nbsp;<i class="bi-pencil"></i></a>
                                             </div>
                                         </div>

                                         </td>
                                       </tr>
                                   <#else>
                                        ${SystemLabelMap.ShippingAddressNotExists}
                                   </#if>
                                 </#list>
                               </#if>
                            </table>
                        </div>
                    </div>
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