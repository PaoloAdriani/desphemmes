<#--------------- HEAD SECTION MACROS --------------->
<#import "common/commonMessages.ftl" as commonMsg>


<#-- added header -->
<#macro add_page_head> </#macro>

<#-- added header -->
<#macro add_page_head_after_head_tag> </#macro>


<#-- added header -->
<#macro add_page_head_before_head_tag> </#macro>

<#-- added header title data-->
<#macro page_head_title> </#macro>


<#--  common head -->
<#macro page_head> <@common_page_head/></#macro>

<#-------------- END HEAD SECTION ------------->







<#--------------- FOOTER SECTION MACROS --------------->

<#-- eventually added footer -->
<#macro js_script_before_footer> </#macro>

<#-- eventually added footer -->
<#macro js_script_after_footer> </#macro>

<#-------------- END FOOTER SECTION ------------->






<#--------------- BODY SECTION MACROS --------------->

<#-- page body -->
<#macro page_body> </#macro>

<#-- after page body -->
<#macro after_body_script> </#macro>

<#-- pre page body -->
<#macro pre_body_script> </#macro>


<#-- page body -->
<#macro page_body_common  >
	<@pre_body_script/>
	<@page_body/>
	<@after_body_script/>
</#macro>


<#--------------- END BODY SECTION MACROS --------------->


<#--------------- PAGE BASE DEFINITION MACROS --------------->


<#-- base total page -->
<#macro display_page>

 	<!DOCTYPE html>

	 	<@page_head/>

	    <body class="stretched side-panel-left">

        <#assign session = request.getSession()?if_exists>

        <!-- Document Wrapper
        ============================================= -->
        <div id="wrapper">

	      <#include "header.ftl" />

	      <div class="container mt-3">
            <@commonMsg.renderMessages/>
          </div>

	      <@page_body_common/>

	      <@common_footer/>

        </div>

        <#include "common/shippingCountryPopup.ftl" />
        <#include "goToTop.ftl" />

	    </body>

     </html>

</#macro>



<#--------------- END PAGE BASE DEFINITION MACROS --------------->






<#--------------- DEFAULTS  TEMPLATE ---------------------->

<#-- default page header  -->
<#macro common_page_head>

		<#include "html_lang.ftl" />
		<@add_page_head_before_head_tag/>

		<head>

			<#include "head_meta.ftl" />
			<#include "stylesheet.ftl" />
			<@page_head_title/>
			<@add_page_head/>

		</head>

		<@add_page_head_after_head_tag/>

</#macro>


<#-- common footer  -->
<#macro common_footer>

 	<@js_script_before_footer/>
	<#include "footer.ftl" />
 	<@js_script_after_footer/>

</#macro>






<#--------------- END DEFAULTS  ---------------------->