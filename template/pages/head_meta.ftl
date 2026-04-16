<meta name="pcn" content="${templatename?if_exists}">
<meta name="webapp" content="${request.getContextPath()}">
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<meta http-equiv="x-ua-compatible" content="IE=edge">
<meta name="author" content="">
<meta name="description" content="Desphemmes | Sito ufficiale">
<#assign csrfDefenseStrategy = Static["org.apache.ofbiz.entity.util.EntityUtilProperties"].getPropertyValue("security", "csrf.defense.strategy", "org.apache.ofbiz.security.NoCsrfDefenseStrategy", delegator)>
<#if csrfDefenseStrategy != "org.apache.ofbiz.security.NoCsrfDefenseStrategy">
    <meta name="csrf-token" content="<@csrfTokenAjax/>"/>
</#if>