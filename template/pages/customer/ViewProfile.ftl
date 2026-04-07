<#include "../base.ftl" />

<#macro page_head_title>
<title>Des Phemmes | Sito Uffiicale</title>
</#macro>

<#-- ========================= -->
<#-- MACRO: HEADER PROFILO -->
<#-- ========================= -->
<#macro profileHeader>
<h2>
  ${SystemLabelMap.PartyTheProfileOf}
  <#if person??>
    ${person.personalTitle!}
    ${person.firstName!}
    ${person.middleName!}
    ${person.lastName!}
    ${person.suffix!}
  <#else>
    "${SystemLabelMap.PartyNewUser}"
  </#if>
</h2>
</#macro>

<#-- ========================= -->
<#-- MACRO: PERSONAL INFO -->
<#-- ========================= -->
<#macro personalInfo>
<div class="card mb-3">
  <div class="card-header">
    <strong>${SystemLabelMap.PartyPersonalInformation}</strong>
  </div>
  <div class="card-body">
    <#if person??>
      <div>
        <strong>${SystemLabelMap.PartyName}:</strong><br/>
        ${person.personalTitle!}
        ${person.firstName!}
        ${person.middleName!}
        ${person.lastName!}
        ${person.suffix!}
      </div>
    <#else>
      ${SystemLabelMap.PartyPersonalInformationNotFound}
    </#if>
  </div>
</div>
</#macro>

<#-- ========================= -->
<#-- MACRO: CONTACT TABLE (DESKTOP) -->
<#-- ========================= -->
<#macro contactTable contacts>
<div class="table-responsive">
  <table class="table">
    <thead class="table-light">
      <tr>
        <th>${SystemLabelMap.PartyContactType}</th>
        <th>${SystemLabelMap.CommonInformation}</th>
        <th></th>
      </tr>
    </thead>
    <tbody>
    <#list contacts as item>
      <@contactRow item=item />
    </#list>
    </tbody>
  </table>
</div>
</#macro>

<#-- ========================= -->
<#-- MACRO: CONTACT ROW -->
<#-- ========================= -->
<#macro contactRow item>
<#assign contactMech = item.contactMech! />
<#assign contactMechType = item.contactMechType! />
<#assign partyContactMech = item.partyContactMech! />

<tr>
  <td>${contactMechType.get("description",locale)}</td>
  <td>
    <@contactInfo item=item />
  </td>
  <td>
    <@contactActions contactMech=contactMech />
  </td>
</tr>
</#macro>

<#-- ========================= -->
<#-- MACRO: CONTACT CARD (MOBILE) -->
<#-- ========================= -->
<#macro contactCards contacts>
<#list contacts as item>
  <@contactCard item=item />
</#list>
</#macro>

<#macro contactCard item>
<#assign contactMech = item.contactMech! />
<#assign contactMechType = item.contactMechType! />

<div class="card mb-3 shadow-sm">
  <div class="card-body">

    <div class="d-flex justify-content-between">
      <strong>${contactMechType.get("description",locale)}</strong>
    </div>

    <div class="mt-2">
      <@contactInfo item=item />
    </div>

    <div class="mt-3 d-flex gap-2">
      <@contactActions contactMech=contactMech block=true />
    </div>

  </div>
</div>
</#macro>

<#-- ========================= -->
<#-- MACRO: CONTACT INFO -->
<#-- ========================= -->
<#macro contactInfo item>
<#assign contactMech = item.contactMech! />

<#if contactMech.contactMechTypeId == "POSTAL_ADDRESS">
  <#assign postalAddress = item.postalAddress! />
  <#if postalAddress??>
    ${postalAddress.address1}<br/>
    ${postalAddress.city} ${postalAddress.postalCode!}
  </#if>

<#elseif contactMech.contactMechTypeId == "TELECOM_NUMBER">
  <#assign telecom = item.telecomNumber! />
  <#if telecom??>
    ${telecom.countryCode!} ${telecom.contactNumber!}
  </#if>

<#elseif contactMech.contactMechTypeId == "EMAIL_ADDRESS">
  ${contactMech.infoString!}
</#if>
</#macro>

<#-- ========================= -->
<#-- MACRO: ACTIONS -->
<#-- ========================= -->
<#macro contactActions contactMech block=false>
<form name="delete_${contactMech.contactMechId}" method="post"
      action="<@ofbizUrl>deleteContactMech</@ofbizUrl>">

  <input type="hidden" name="contactMechId" value="${contactMech.contactMechId}"/>

  <a href="<@ofbizUrl>editcontactmech?contactMechId=${contactMech.contactMechId}</@ofbizUrl>"
     class="btn btn-sm btn-outline-secondary ${block?string('w-100','')}">
    ${SystemLabelMap.CommonUpdate}
  </a>

  <a href="javascript:document.delete_${contactMech.contactMechId}.submit()"
     class="btn btn-sm btn-outline-danger ${block?string('w-100','')}">
    ${SystemLabelMap.CommonDelete}
  </a>

</form>
</#macro>

<#-- ========================= -->
<#-- PAGE BODY -->
<#-- ========================= -->
<#macro page_body>

<section id="content">
  <div class="content-wrap">
    <div class="container">

      <#if party??>

        <@profileHeader />

        <@personalInfo />

        <div class="card">
          <div class="card-header d-flex justify-content-between">
            <strong>${SystemLabelMap.PartyContactInformation}</strong>
            <a href="<@ofbizUrl>editcontactmech</@ofbizUrl>"
               class="btn btn-sm btn-outline-secondary">
              ${SystemLabelMap.CommonCreate}
            </a>
          </div>

          <div class="card-body">

            <#if partyContactMechValueMaps?has_content>

              <!-- DESKTOP -->
              <div class="d-none d-md-block">
                <@contactTable contacts=partyContactMechValueMaps />
              </div>

              <!-- MOBILE -->
              <div class="d-block d-md-none">
                <@contactCards contacts=partyContactMechValueMaps />
              </div>

            <#else>
              ${SystemLabelMap.PartyNoContactInformation}
            </#if>

          </div>
        </div>

        <div class="card mt-3">
          <div class="card-header d-flex justify-content-between">
            <strong>${SystemLabelMap.CommonUsername}</strong>
            <a class="btn btn-sm btn-outline-secondary"
               href="<@ofbizUrl>passwordChange</@ofbizUrl>">
              ${SystemLabelMap.PartyChangePassword}
            </a>
          </div>

          <div class="card-body">
            ${userLogin.userLoginId}
          </div>
        </div>

      <#else>
        ${SystemLabelMap.PartyNoPartyForCurrentUserName}: ${userLogin.userLoginId}
      </#if>

    </div>
  </div>
</section>

</#macro>

<@display_page/>