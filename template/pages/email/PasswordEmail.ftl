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

<html>
<head>
</head>
<body>
  <div>${SystemLabelMap.SecurityExtThisEmailIsInResponseToYourRequestToHave} ${SystemLabelMap.SecurityExtANew} ${SystemLabelMap.SecurityExtPasswordSentToYou}.</div>
  <div>${SystemLabelMap.SecurityExtIgnoreEmail}.</div>
  
  <br />
  <div>
    <#assign webapp = "dp_eu">
    <#if webSiteId == "desphemmesSiteItaly">
      <#assign webapp = "dp_it">
    </#if>

    <#assign resetUrl = "https://desphemmes.test.mpstyle.it:8445/" + webapp
              + "/control/passwordChange"
              + "?USERNAME=${userLogin.userLoginId!}"
              + "&TOKEN=" + token!
              + "&forgotPwdFlag=true"
              + "&tenantId=" + (tenantId!"")
    >

    <#--
    <#assign resetUrl = "https://fisico.test.mpstyle.it:8443/" + webapp
          + "/control/passwordChange"
          + "?USERNAME=${userLogin.userLoginId!}"
          + "&TOKEN=" + token!
          + "&forgotPwdFlag=true"
          + "&tenantId=" + (tenantId!"")
    >
    -->
    <#--
    <#assign resetUrl = "https://fisico.local:8443/" + webapp
      + "/control/passwordChange"
      + "?USERNAME=${userLogin.userLoginId!}"
      + "&TOKEN=" + token!
      + "&forgotPwdFlag=true"
      + "&tenantId=" + (tenantId!"")
    >
    -->

    <a style="background-color: #000; color: #fff; padding: 15px;" href="${resetUrl}">
      ${SystemLabelMap.ResetPassword!}
    </a>

    <br />
    <br />
    <br />
    ${SystemLabelMap.SecurityExtLinkOnce}
  </div>
</body>
</html>
