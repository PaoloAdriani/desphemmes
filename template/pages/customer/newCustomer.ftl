<#include "../base.ftl" />

<#macro page_head_title>

<!-- Document Title
============================================= -->
<title>Des Phemmes | Nuovo utente</title>

</#macro>

<#macro add_page_head_after_head_tag>

    <style type="text/css">

        label.error {
            display: block !important;
            color: #dc3545;
            font-size: 0.9em;
            margin-top: 4px;
        }

        .input-error {
            border: 1px solid #dc3545 !important;
        }

        .error-message {
            color: #dc3545;
            font-size: 0.85em;
            margin-top: 4px;
        }

    </style>

    <script>

    const OFBIZ_URL_GET_STATES =
        "<@ofbizUrl>getAssociatedStateList</@ofbizUrl>";

    </script>


</#macro>

<#macro fieldErrors fieldName>
  <#if errorMessageList?has_content>
    <#assign fieldMessages =
        Static["org.apache.ofbiz.base.util.MessageString"].getMessagesForField(fieldName, true, errorMessageList)>
      <ul>
        <#list fieldMessages as errorMsg>
          <li class="errorMessage" style="color: red;">${errorMsg}</li>
        </#list>
      </ul>
  </#if>
</#macro>

<#macro fieldErrorsMulti fieldName1 fieldName2 fieldName3 fieldName4>
  <#if errorMessageList?has_content>
    <#assign fieldMessages =
        Static["org.apache.ofbiz.base.util.MessageString"].getMessagesForField(fieldName1, fieldName2,
        fieldName3, fieldName4, true, errorMessageList)>
  <ul>
    <#list fieldMessages as errorMsg>
      <li class="errorMessage">${errorMsg}</li>
    </#list>
  </ul>
  </#if>
</#macro>

<#macro geoSelect countryId stateId>

<div class="col-12 form-group">
    <label>${SystemLabelMap.CommonCountry}*</label>

    <select id="newuserform_countryGeoId"
            name="CUSTOMER_COUNTRY"
            class="form-control form-control-sm mb-2">

        ${screens.render("component://common/widget/CommonScreens.xml#countries")}

    </select>

    <select id="newuserform_stateProvinceGeoId"
            name="CUSTOMER_STATE"
            class="form-control form-control-sm">

        <option value="">Seleziona una provincia</option>

    </select>
</div>

</#macro>


<#macro page_body>

<section id="content">
    <div class="content-wrap">
        <div class="container">
            <div class="card mb-0 upper">
                <div class="card-body" style="padding: 40px;">
                    <h3>${SystemLabelMap.PartyCreateAccount}</h3>
                    <p>${SystemLabelMap.CommonFieldsMarkedAreRequired}</p>

                    <form id="newuserform" name="newuserform" method="post" class="row mb-0" action="<@ofbizUrl>createcustomer${previousParams}</@ofbizUrl>">

                            <input type="hidden" name="emailProductStoreId" value="${productStoreId}"/>

                            <div class="col-12 form-group">
                                <label for="USER_FIRST_NAME">${SystemLabelMap.PartyFirstName}*</label>
                                <@fieldErrors fieldName="USER_FIRST_NAME"/>
                                <input type="text" name="USER_FIRST_NAME" id="USER_FIRST_NAME" value="${requestParameters.USER_FIRST_NAME!}" class="form-control form-control-sm" required/>
                            </div>

                            <div class="col-12 form-group">
                                <label for="USER_LAST_NAME">${SystemLabelMap.PartyLastName}*</label>
                                <@fieldErrors fieldName="USER_LAST_NAME"/>
                                <input type="text" name="USER_LAST_NAME" id="USER_LAST_NAME" value="${requestParameters.USER_LAST_NAME!}" class="form-control form-control-sm" required/>
                            </div>

                            <div class="col-12 form-group">
                                <label for="CUSTOMER_EMAIL">${SystemLabelMap.PartyEmailAddress}*</label>
                                <@fieldErrors fieldName="CUSTOMER_EMAIL"/>
                                <input type="text" name="CUSTOMER_EMAIL" id="CUSTOMER_EMAIL" value="${requestParameters.CUSTOMER_EMAIL!}" class="form-control form-control-sm" onchange="changeEmail()" onkeyup="changeEmail()" required/>
                            </div>

                            <div class="col-12 form-group">
                                <label for="CUSTOMER_ADDRESS1">${SystemLabelMap.PartyAddressLine1}*</label>
                                <@fieldErrors fieldName="CUSTOMER_ADDRESS1"/>
                                <input type="text" name="CUSTOMER_ADDRESS1" id="CUSTOMER_ADDRESS1"
                                     value="${requestParameters.CUSTOMER_ADDRESS1!}" class="form-control form-control-sm" required/>
                            </div>

                            <div class="col-12 form-group">
                                <label for="CUSTOMER_CITY">${SystemLabelMap.PartyCity}*</label>
                                        <@fieldErrors fieldName="CUSTOMER_CITY"/>
                                        <input type="text" name="CUSTOMER_CITY" id="CUSTOMER_CITY" value="${requestParameters.CUSTOMER_CITY!}" class="form-control form-control-sm" required/>
                            </div>

                            <div class="col-12 form-group">
                                 <label for="CUSTOMER_POSTAL_CODE">${SystemLabelMap.PartyZipCode}*</label>
                                        <@fieldErrors fieldName="CUSTOMER_POSTAL_CODE"/>
                                        <input type="text" name="CUSTOMER_POSTAL_CODE" id="CUSTOMER_POSTAL_CODE"
                                          value="${requestParameters.CUSTOMER_POSTAL_CODE!}" class="form-control form-control-sm" required/>
                            </div>

                            <@geoSelect countryId="newuserform_countryGeoId" stateId="newuserform_stateProvinceGeoId"/>

                            <div class="col-12 form-group">
                                <label>${SystemLabelMap.PartyPhoneNumber}</label>
                                <input type="text" name="CUSTOMER_MOBILE_CONTACT" class="form-control form-control-sm" value="${requestParameters.CUSTOMER_MOBILE_CONTACT!}" required/>
                            </div>

                            <div>
                                <legend><#if getUsername>${SystemLabelMap.CommonUsername}</#if></legend>
                                    <#if getUsername>
                                      <@fieldErrors fieldName="USERNAME"/>
                                      <#if !requestParameters.preferredUsername?has_content>
                                        <div class="form-check">
                                            <input type="checkbox" name="UNUSEEMAIL" class="form-check-input" id="UNUSEEMAIL" value="on" checked disabled/>
                                            <label>${SystemLabelMap.EcommerceUseEmailAddress}</label>
                                        </div>
                                      </#if>

                                      <div class="row form-group">
                                        <div class="col-12">
                                            <#--<label for="USERNAME">${SystemLabelMap.CommonUsername}*</label>-->
                                            <input type="hidden" name="USERNAME" id="USERNAME" value="${requestParameters.CUSTOMER_EMAIL!}" />

                                            <#--
                                            <#if requestParameters.preferredUsername?has_content>
                                                <input type="text" name="showUserName" id="showUserName" value="${requestParameters.USERNAME!}"
                                                    disabled="disabled"/>
                                                <input type="hidden" name="USERNAME" id="USERNAME" value="${requestParameters.USERNAME!}"/>
                                            <#else>
                                                <input type="text" name="USERNAME" id="USERNAME" value="${requestParameters.USERNAME!}"
                                                    class="form-control form-control-sm" />
                                            </#if>
                                            -->
                                        </div>
                                      </div>
                                    </#if>
                            </div>

                            <div>
                                <legend>${SystemLabelMap.CommonPassword}</legend>
                                    <#if createAllowPassword>
                                      <div class="row form-group">
                                      <div class="col-12">
                                        <label for="PASSWORD">${SystemLabelMap.CommonPassword}*</label>
                                        <@fieldErrors fieldName="PASSWORD"/>
                                        <input type="password" name="PASSWORD" class="form-control form-control-sm" autocomplete="off" id="PASSWORD"  required/>
                                      </div>
                                      </div>

                                      <div class="row form-group">
                                      <div class="col-12">
                                        <label for="CONFIRM_PASSWORD">${SystemLabelMap.PartyRepeatPassword}*</label>
                                        <@fieldErrors fieldName="CONFIRM_PASSWORD"/>
                                        <input type="password" class="form-control form-control-sm" name="CONFIRM_PASSWORD" id="CONFIRM_PASSWORD" autocomplete="off" value="" maxlength="50" required/>
                                      </div>
                                      </div>

                                    <#else>
                                      <div>
                                        <label>${SystemLabelMap.PartyReceivePasswordByEmail}.</div>
                                      </div>
                                    </#if>
                            </div>

                    </form>
                </div>
            </div>
            <div class="d-flex justify-content-center mt-5">
              <a href="<@ofbizUrl>index</@ofbizUrl>" class="button button-small button-3d button-black m-0 upper">${SystemLabelMap.CommonCancel}</a>&nbsp;
              <button type="submit" form="newuserform" class="button button-small button-3d button-black m-0 upper">${SystemLabelMap.CommonSave}</button>
            </div>
        </div>
    </div>
</section>

</#macro>

<@display_page/>