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


<#macro page_body>

<section id="content">
    <div class="content-wrap">
        <div class="container">
            <div class="card mb-0 upper">
                <div class="card">
                  <div class="card-header">
                    <h3>${SystemLabelMap.PartyChangePassword}</h3>
                    <label>${SystemLabelMap.CommonFieldsMarkedAreRequired}</label>
                  </div>
                  <div class="card-body">

                            <#if parameters.TOKEN?has_content>
                                <form id="changepasswordform" method="post"
                                      action="<@ofbizUrl>updatePasswordWithToken/${donePage}</@ofbizUrl>">
                                  <input type="hidden" name="TOKEN" value="${parameters.TOKEN}"/>
                                  <input type="hidden" name="userLoginId" value="${parameters.USERLOGIN!}"/>
                            <#else>
                                <form id="changepasswordform" method="post"
                                      action="<@ofbizUrl>updatePassword/${donePage}</@ofbizUrl>">
                                  <#if !parameters.TOKEN?has_content>
                                    <label class="mt-4 asteriskInput" for="currentPassword">
                                        ${SystemLabelMap.PartyOldPassword}
                                    </label>
                                    <div class="row">
                                      <div class="col-sm-6">
                                        <input type="password" class="form-control" name="currentPassword"
                                               autocomplete="off" id="currentPassword"/>
                                      </div>
                                    </div>
                                  </#if>
                            </#if>

                            <#--
                          <#if !parameters.TOKEN?has_content>
                            <label class="mt-4 asteriskInput" for="currentPassword">${SystemLabelMap.PartyOldPassword}</label>
                            <div class="row">
                              <div class="col-sm-6">
                                <input type="password" class="form-control" name="currentPassword" autocomplete="off" id="currentPassword"/>
                              </div>
                            </div>
                          <#else>
                            <input type="hidden" name="TOKEN" value="${parameters.TOKEN}"/>
                          </#if>
                            -->
                            <label  class="required" for="newPassword">${SystemLabelMap.PartyNewPassword}</label>
                            <div class="row">
                              <div class="col-sm-6">
                                <input type="password" class="form-control" name="newPassword" autocomplete="off" id="newPassword"/>
                              </div>
                            </div>
                            <label class="required" for="newPasswordVerify">${SystemLabelMap.PartyNewPasswordVerify}</label>
                            <div class="row">
                              <div class="col-sm-6">
                                  <input type="password" class="form-control" name="newPasswordVerify" autocomplete="off" id="newPasswordVerify"/>
                              </div>
                            </div>
                            <#--
                            <label class="required" for="passwordHint">${SystemLabelMap.PartyPasswordHint}</label>
                            <div class="row">
                              <div class="col-sm-6">
                                  <input type="text" class="form-control" name="passwordHint" id="passwordHint" value="${userLoginData.passwordHint!}"/>
                              </div>
                            </div>
                            -->
                          <div class="form-group">
                            <label>${SystemLabelMap.CommonFieldsMarkedAreRequired}</label>
                          </div>
                      </form>
                      <a href="<@ofbizUrl>${donePage}</@ofbizUrl>" class="btn btn-outline-secondary">${SystemLabelMap.CommonGoBack}</a>
                      <a href="javascript:document.getElementById('changepasswordform').submit()" class="btn btn-outline-secondary">
                        ${SystemLabelMap.CommonSave}
                      </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

</#macro>
<@display_page/>
