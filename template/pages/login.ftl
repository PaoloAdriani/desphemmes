<#include "base.ftl" />

<#macro page_head_title>

<!-- Document Title
============================================= -->
<title>Des Phemmes | Login</title>

</#macro>

<#macro page_body>

<section id="content">
    <div class="content-wrap pb-0">
	    <div class="container-fluid mt-5">
            <div class="column">
                <div class="card mx-auto" style="max-width: 540px;">
                    <div class="card-header py-3 bg-transparent text-center">
                        <h3 class="mb-0 fw-normal upper">${SystemLabelMap.WelcomeBack}</h3>
                    </div>
                    <div class="card-body mx-auto py-5" style="max-width: 70%;">

                        <form id="login-form" name="loginform" class="mb-0 row" action="<@ofbizUrl>login</@ofbizUrl>" method="post">

                            <div class="col-12">
                                <input type="text" id="userName" name="USERNAME" value="<#if requestParameters.USERNAME?has_content>${requestParameters.USERNAME}<#elseif autoUserLogin?has_content>${autoUserLogin.userLoginId}</#if>" class="form-control not-dark" placeholder="${SystemLabelMap.Username}">
                            </div>

                            <div class="col-12 mt-4">
                                <input type="password" id="password" name="PASSWORD" value="" class="form-control not-dark" placeholder="${SystemLabelMap.Password}">
                            </div>

                            <div class="col-12 text-lg-end text-center font-sz-small mt-2">
                                <a class="text-dark fw-light upper" data-bs-toggle="collapse" href="#collapseForm" aria-expanded="false" aria-controls="collapseForm">${SystemLabelMap.CommonForgotYourPassword}?</a>
                            </div>

                            <div class="col-12 mt-4">
                                <button class="button w-100 m-0 upper" id="login-form-submit" name="login-form-submit" value="Login">${SystemLabelMap.Login}</button>
                            </div>
                        </form>
                    </div>
                    <div class="card-footer py-4 text-center">
                        <p class="mb-0 font-regular upper">${SystemLabelMap.DontHaveAccount}? <a href="<@ofbizUrl>newCustomer</@ofbizUrl>" class="upper"><u>${SystemLabelMap.SignUp}</u></a></p>
                    </div>
                </div>

                <div class="collapse card mx-auto" id="collapseForm" style="max-width: 540px; margin-top:5rem;">
                  <div class="d-flex justify-content-center">
                    <div class="card">
                      <div class="card-header text-center upper">
                        <h5 class="mb-0 fw-normal upper">${SystemLabelMap.CommonForgotYourPassword}</h5>
                      </div>
                      <div class="card-block p-1 m-2">
                        <form method="post" action="<@ofbizUrl>forgotpassword</@ofbizUrl>">
                            <div class="form-group upper">
                              <label for="forgotpassword_userName">${SystemLabelMap.CommonUsername}</label>
                              <input type="text" class="form-control" id="forgotpassword_userName" name="USERNAME" value="<#if requestParameters.USERNAME?has_content>${requestParameters.USERNAME}<#elseif autoUserLogin?has_content>${autoUserLogin.userLoginId}</#if>"/>
                            </div>
                            <div class="form-group">
                              <input type="submit" class="button w-100 m-0 upper" name="EMAIL_PASSWORD" value="${SystemLabelMap.CommonEmailPassword}"/>
                            </div>
                        </form>
                      </div>
                    </div>
                  </div>
                </div>
            </div>
        </div>
    </div>
</section>
<br>
</#macro>

<@display_page/>