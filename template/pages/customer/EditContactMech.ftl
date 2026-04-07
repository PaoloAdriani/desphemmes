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
<#include "../base.ftl" />

<#macro page_head_title>

<!-- Document Title
============================================= -->
<title>Des Phemmes | Sito Uffiicale</title>

</#macro>

<#macro add_page_head_after_head_tag>

    <script>

        const OFBIZ_URL_GET_STATES =
            "<@ofbizUrl>getAssociatedStateList</@ofbizUrl>";

    </script>

</#macro>

<#macro geoSelect countryId stateId postalAddress={}>

<#if (postalAddress??) && (postalAddress.countryGeoId??)>
    <#assign defaultCountryGeoId = postalAddress.countryGeoId>
<#else>
    <#assign defaultCountryGeoId =
    Static["org.apache.ofbiz.entity.util.EntityUtilProperties"]
    .getPropertyValue("general","country.geo.id.default",delegator)>
</#if>

<div class="row">
    <div class="col-sm-6">
        <label>${SystemLabelMap.CommonCountry}</label>

        <select id="${countryId}"
                name="countryGeoId"
                class="custom-select form-control"
                data-selected="${defaultCountryGeoId}">

            ${screens.render("component://common/widget/CommonScreens.xml#countries")}

        </select>
    </div>
</div>

<div class="row">
    <div class="col-sm-6">
        <label>${SystemLabelMap.CommonProvince}</label>

        <select id="${stateId}"
                name="stateProvinceGeoId"
                class="custom-select form-control"
                data-selected="${postalAddress.stateProvinceGeoId!}">

            <option value="">Seleziona una provincia</option>

        </select>
    </div>
</div>

</#macro>

<#macro page_body>

<section id="content">
    <div class="content-wrap">
        <div class="container">
            <div class="card mb-0 upper">
                <#if canNotView>
                    <h3>${SystemLabelMap.PartyContactInfoNotBelongToYou}.</h3>
                    <a href="<@ofbizUrl>${donePage}</@ofbizUrl>" class="btn btn-outline-secondary">${uiLabelMap.CommonBack}</a>
                <#else>
                    <#if !contactMech??>
                        <#-- When creating a new contact mech, first select the type, then actually create -->
                        <#if !requestParameters.preContactMechTypeId?? && !preContactMechTypeId??>
                            <h2>${SystemLabelMap.PartyCreateNewContactInfo}</h2>
                            <form method="post" class="form-inline" action='<@ofbizUrl>editcontactmechnosave</@ofbizUrl>' name="createcontactmechform">
                                    <label class="mr-2">${SystemLabelMap.PartySelectContactType}:</label>
                                      <select name="preContactMechTypeId" class="form-control custom-select mr-2">
                                        <#list contactMechTypes as contactMechType>
                                          <#if contactMechType.contactMechTypeId == "EMAIL_ADDRESS" || contactMechType.contactMechTypeId == "POSTAL_ADDRESS" || contactMechType.contactMechTypeId == "TELECOM_NUMBER">
                                              <option value='${contactMechType.contactMechTypeId}'>
                                                ${contactMechType.get("description",locale)}
                                              </option>
                                          </#if>
                                        </#list>
                                      </select>
                                      <div class="row justify-content-center align-items-center py-2 col-mb-30 col-md-offset-4">
                                        <div class="col-auto">
                                            <a href="javascript:document.createcontactmechform.submit()" class="button button-small button-3d button-black m-0 upper">${SystemLabelMap.CommonCreate}</a>
                                        </div>
                                      </div>
                            </form>
                            <#-- <p><h3>ERROR: Contact information with ID "${contactMechId}" not found!</h3></p> -->
                        </#if>
                    </#if>

                <#if contactMechTypeId??>
                    <#if !contactMech??>
                        <h2>${SystemLabelMap.PartyCreateNewContactInfo}</h2>
                        <table width="90%" border="0" cellpadding="2" cellspacing="0">
                            <form method="post" action='<@ofbizUrl>${reqName}</@ofbizUrl>' name="editcontactmechform" id="editcontactmechform">
                              <input type='hidden' name='contactMechTypeId' value='${contactMechTypeId}'/>

                              <#if cmNewPurposeTypeId?has_content>
                                <input type='hidden' name='contactMechPurposeTypeId' value='${cmNewPurposeTypeId}'/>
                              </#if>
                              <#if preContactMechTypeId?has_content>
                                <input type='hidden' name='preContactMechTypeId' value='${preContactMechTypeId}'/>
                              </#if>
                              <#if paymentMethodId?has_content>
                                <input type='hidden' name='paymentMethodId' value='${paymentMethodId}'/>
                              </#if>
                    <#else>
                            <h2>${SystemLabelMap.PartyEditContactInfo}</h2>
                            <#--
                            <p class="my-2"><strong>${SystemLabelMap.PartyContactPurposes}</strong></p>
                            <div class="row">
                                <div class="col-sm-6">
                                    <#list partyContactMechPurposes! as partyContactMechPurpose>
                                      <#assign contactMechPurposeType = partyContactMechPurpose.getRelatedOne("ContactMechPurposeType", true) />
                                          <form name="expirePartyContactMechPurpose_${partyContactMechPurpose.contactMechPurposeTypeId}" class="my-2"
                                                method="post" action="<@ofbizUrl>expirePartyContactMechPurpose</@ofbizUrl>">
                                            <div class="form-group">
                                              <label class="my-2">
                                                <#if contactMechPurposeType??>
                                                ${contactMechPurposeType.get("description",locale)}
                                                <#else>
                                                ${uiLabelMap.PartyPurposeTypeNotFound}: "${partyContactMechPurpose.contactMechPurposeTypeId}"
                                                </#if>
                                                (${uiLabelMap.CommonSince}:${partyContactMechPurpose.fromDate.toString()})
                                                <#if partyContactMechPurpose.thruDate??>(${uiLabelMap.CommonExpires}
                                                  :${partyContactMechPurpose.thruDate.toString()})</#if>
                                              </label>
                                              <input type="hidden" name="contactMechId" value="${contactMechId}"/>
                                              <input type="hidden" name="contactMechPurposeTypeId"
                                                     value="${partyContactMechPurpose.contactMechPurposeTypeId}"/>
                                              <input type="hidden" name="fromDate" value="${partyContactMechPurpose.fromDate}"/>
                                              <input type="hidden" name="useValues" value="true"/>
                                              <a href='javascript:document.expirePartyContactMechPurpose_${partyContactMechPurpose.contactMechPurposeTypeId}.submit()'
                                                 class="btn btn-outline-secondary">${uiLabelMap.CommonDelete}</a>
                                            </div>
                                          </form>
                                    </#list>
                                    <#if purposeTypes?has_content>
                                          <form method="post" class="form-inline" action='<@ofbizUrl>createPartyContactMechPurpose</@ofbizUrl>'
                                                name='newpurposeform'>
                                              <input type="hidden" name="contactMechId" value="${contactMechId}"/>
                                              <input type="hidden" name="useValues" value="true"/>
                                              <select name='contactMechPurposeTypeId' class="custom-select form-control">
                                                <option>${uiLabelMap.CommonSelect}</option>
                                                <#list purposeTypes as contactMechPurposeType>
                                                  <option value='${contactMechPurposeType.contactMechPurposeTypeId}'>
                                                    ${contactMechPurposeType.get("description",locale)}
                                                  </option>
                                                </#list>
                                              </select>
                                            <a href='javascript:document.newpurposeform.submit()' class="btn btn-outline-secondary">${uiLabelMap.PartyAddPurpose}</a>
                                          </form>
                                    </#if>
                                </div>
                            </div>
                            -->
                            <form method="post" action='<@ofbizUrl>${reqName}</@ofbizUrl>' name="editcontactmechform" id="editcontactmechform">
                              <input type="hidden" name="contactMechId" value='${contactMechId}'/>
                              <input type="hidden" name="contactMechTypeId" value='${contactMechTypeId}'/>
                    </#if>

                                <#if contactMechTypeId = "POSTAL_ADDRESS">
                                  <div class="row">
                                    <div class="col-sm-6">
                                      <label class="my-2">${SystemLabelMap.PartyToName}</label>
                                      <input type="text" class="form-control" name="toName"
                                          value="${postalAddressData.toName!}"/>
                                    </div>
                                  </div>
                                  <#--
                                  <div class="row">
                                    <div class="col-sm-6">
                                      <label class="my-2">${SystemLabelMap.PartyAttentionName}</label>
                                      <input type="text" class="form-control" name="attnName"
                                          value="${postalAddressData.attnName!}"/>
                                    </div>
                                  </div>
                                  -->
                                  <div class="row">
                                    <div class="col-sm-6">
                                      <label class="my-2">${SystemLabelMap.PartyAddressLine1}</label>
                                      <input type="text" class="form-control" name="address1"
                                          value="${postalAddressData.address1!}"/>
                                    </div>
                                  </div>
                                  <#--
                                  <div class="row">
                                    <div class="col-sm-6">
                                      <label class="my-2">${SystemLabelMap.PartyAddressLine2}</label>
                                      <input type="text" class="form-control" name="address2"
                                          value="${postalAddressData.address2!}"/>
                                    </div>
                                  </div>
                                  -->
                                  <div class="row">
                                    <div class="col-sm-6">
                                    <label class="my-2">${SystemLabelMap.PartyCity}</label>
                                      <input type="text" class="form-control" name="city" value="${postalAddressData.city!}"/>
                                    </div>
                                  </div>
                                  <#--
                                  <div class="row">
                                    <div class="col-sm-6">
                                      <label class="my-2"> ${SystemLabelMap.PartyState}</label>
                                      <select name="stateProvinceGeoId" id="editcontactmechform_stateProvinceGeoId" class="custom-select form-control">
                                      </select>
                                    </div>
                                  </div>
                                  -->

                                  <@geoSelect countryId="editcontactmechform_countryGeoId" stateId="editcontactmechform_stateProvinceGeoId" postalAddress=postalAddress />

                                  <div class="row">
                                    <div class="col-sm-6">
                                      <label class="my-2">${SystemLabelMap.PartyZipCode}</label>
                                      <input type="text" class="form-control" name="postalCode"
                                             value="${postalAddressData.postalCode!}"/>
                                    </div>
                                  </div>

                                  <#--
                                  <div class="row">
                                    <div class="col-sm-6">
                                      <label class="my-2">${SystemLabelMap.CommonCountry}</label>
                                      <select name="countryGeoId" class="custom-select form-control" id="editcontactmechform_countryGeoId">
                                        ${screens.render("component://common/widget/CommonScreens.xml#countries")}
                                        <#if (postalAddress??) && (postalAddress.countryGeoId??)>
                                          <#assign defaultCountryGeoId = postalAddress.countryGeoId>
                                        <#else>
                                          <#assign defaultCountryGeoId = Static["org.apache.ofbiz.entity.util.EntityUtilProperties"]
                                              .getPropertyValue("general", "country.geo.id.default", delegator)>
                                        </#if>
                                        <option selected="selected" value="${defaultCountryGeoId}">
                                          <#assign countryGeo = delegator.findOne("Geo",Static["org.apache.ofbiz.base.util.UtilMisc"]
                                              .toMap("geoId",defaultCountryGeoId), false)>
                                          ${countryGeo.get("geoName",locale)}
                                        </option>
                                      </select>
                                    </div>
                                  </div>
                                  -->
                                <#elseif contactMechTypeId = "TELECOM_NUMBER">
                                    <div class="form-group">
                                      <label class="my-2">${SystemLabelMap.PartyPhoneNumber}</label>
                                      <div class="row">
                                        <#--
                                        <div class="col-sm-2">
                                          <input type="text" class="form-control" name="countryCode"
                                              value="${telecomNumberData.countryCode!}" placeholder="${uiLabelMap.CommonCountryCode}"/>
                                        </div>
                                        <label class="my-2">-</label>
                                        <div class="col-sm-2">
                                          <input type="text" class="form-control" name="areaCode"
                                              value="${telecomNumberData.areaCode!}" placeholder="${uiLabelMap.PartyAreaCode}"/>
                                        </div>
                                        -->
                                        <label class="my-2">-</label>
                                        <div class="col-sm-2">
                                          <input type="text" class="form-control" name="contactNumber"
                                              value="${telecomNumberData.contactNumber!}" placeholder="${SystemLabelMap.PartyContactNumber}"/>
                                        </div>
                                        <#--
                                        <label class="my-2">-</label>
                                        <div class="col-sm-2">
                                          <input type="text" class="form-control"
                                              name="extension" value="${partyContactMechData.extension!}" placeholder="${uiLabelMap.PartyExtension}"/>
                                        </div>
                                        -->
                                      </div>
                                    </div>
                                <#elseif contactMechTypeId = "EMAIL_ADDRESS">
                                      <div class="row">
                                        <div class="col-sm-6">
                                          <label class="my-2">${SystemLabelMap.PartyEmailAddress}</label >
                                          <input type="text" class="form-control" name="emailAddress"
                                              value="<#if tryEntity>${contactMech.infoString!}<#else>${requestParameters.emailAddress!}</#if>"/>
                                        </div>
                                      </div>
                                <#else>
                                      <div class="row">
                                        <div class="col-sm-6">
                                        <label class="my-2">${contactMechType.get("description",locale)!}</label>
                                        <input type="text" class="form-control" name="infoString"
                                              value="${contactMechData.infoString!}"/>
                                        </div>
                                      </div>
                                </#if>
                                <#--
                                <div class="row">
                                  <div class="col-sm-6">
                                    <label class="my-2">${uiLabelMap.PartyAllowSolicitation}?</label>
                                    <select name="allowSolicitation" class=" form-control custom-select mb-2">
                                      <#if ("Y" == ((partyContactMechData.allowSolicitation)!""))>
                                        <option value="Y">${uiLabelMap.CommonY}</option></#if>
                                      <#if ("N" == ((partyContactMechData.allowSolicitation)!""))>
                                        <option value="N">${uiLabelMap.CommonN}</option></#if>
                                      <option></option>
                                      <option value="Y">${uiLabelMap.CommonY}</option>
                                      <option value="N">${uiLabelMap.CommonN}</option>
                                    </select>
                                  </div>
                                </div>
                                -->
                            </form>
                          </table>
                    <div class="row justify-content-center align-items-center py-2 col-mb-30 col-md-offset-4">
                        <div class="col-auto mr-auto">
                            <a href="<@ofbizUrl>${donePage}</@ofbizUrl>" class="button button-small button-3d button-black m-0 upper">${SystemLabelMap.CommonGoBack}</a>
                        </div>
                        <div class="col-auto">
                            <a href="javascript:document.editcontactmechform.submit()" class="button button-small button-3d button-black m-0 upper">${SystemLabelMap.CommonSave}</a>
                        </div>
                    </div>
                <#else>
                    <div class="row justify-content-center align-items-center py-2 col-mb-30 col-md-offset-4">
                        <div class="col-auto">
                            <a href="<@ofbizUrl>${donePage}</@ofbizUrl>" class="button button-small button-3d button-black m-0 upper">${SystemLabelMap.CommonGoBack}</a>
                        </div>
                    </div>
                </#if>
            </#if>
            </div>
        </div>
    </div>
</section>
</#macro>

<@display_page/>
