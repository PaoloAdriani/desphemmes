<!-- Header
		============================================= -->
<header id="header" class="header-size-md" data-sticky-shrink="false" data-sticky-class="not-dark">
    <div id="header-wrap" style="border-bottom: none; background-color: #FFF;">
        <div class="container-fluid">
            <div class="header-row justify-content-lg-center">

                <!-- Logo
                ============================================= -->
                <div id="logo" class="me-lg-auto me-0 order-lg-2 col-lg-auto">
                    <a href="<@ofbizUrl>index</@ofbizUrl>">
                        <img class="logo-default" srcset="<@ofbizContentUrl>${assetspath}/images/logo.png</@ofbizContentUrl>, <@ofbizContentUrl>${assetspath}/images/logo.png</@ofbizContentUrl> 2x" src="<@ofbizContentUrl>${assetspath}/images/logo.png</@ofbizContentUrl>" alt="Des Phemmes Logo">
                        <img class="logo-mobile" srcset="<@ofbizContentUrl>${assetspath}/images/logo.png</@ofbizContentUrl>, <@ofbizContentUrl>${assetspath}/images/logo.png</@ofbizContentUrl> 2x" src="<@ofbizContentUrl>${assetspath}/images/logo.png</@ofbizContentUrl>" alt="Des Phemmes Logo">
                    </a>
                </div><!-- #logo end -->

                <!-- Primary Navigation
                ============================================= -->
                <nav class="primary-menu with-arrows me-lg-0 order-lg-3 order-5">

                    <!-- Menu Right -->
                    <form method="post"
                          name="chooseLanguage"
                          action="<@ofbizUrl>setSessionLocale</@ofbizUrl>"
                          id="chooseLanguageForm">
                        <input type="hidden" name="newLocale" id="newLocaleInput" />
                    </form>

                    <form method="post"
                          name="chooseShippingCountry"
                          action="<@ofbizUrl>setShippingCountry</@ofbizUrl>"
                          id="chooseShippingCountryForm">
                        <input type="hidden" name="shippingCountryGeoId" id="shippingCountryGeoIdInput" />
                    </form>

                    <#include "common/shippingCountries.ftl" />

                    <ul class="menu-container">
                        <i class="bi-flag" style="font-size: 20px;"></i>
                        <li class="menu-item">

                            <!-- Lingua attuale visibile -->
                            <a class="menu-link upper" href="#">
                                <div>
                                    ${locale.getDisplayName(locale)?substring(0, 2)}
                                </div>
                            </a>

                            <ul class="sub-menu-container">

                                <#assign availableLocales = Static["org.apache.ofbiz.base.util.UtilMisc"].availableLocales()/>
                                <#list availableLocales as availableLocale>
                                    <#if (availableLocale == "it_IT") || (availableLocale == "en_US")>

                                        <#assign langAttr = availableLocale.toString()?replace("_", "-")>
                                        <#assign langDir = "ltr">
                                        <#if "ar.iw"?contains(langAttr?substring(0, 2))>
                                            <#assign langDir = "rtl">
                                        </#if>

                                        <li class="menu-item">
                                            <a class="menu-link <#if locale.toString() = availableLocale.toString()>current</#if> upper"
                                               href="#"
                                               lang="${langAttr}"
                                               dir="${langDir}"
                                               data-locale="${availableLocale.toString()}">
                                                <div>
                                                    ${availableLocale.getDisplayName(availableLocale)?substring(0, 2)}
                                                </div>
                                            </a>
                                        </li>

                                    </#if>
                                </#list>

                            </ul>
                        </li>

                        <!-- Nazione spedizione attuale visibile -->
                        <i class="bi-truck" style="font-size: 20px;"></i>
                        <li class="menu-item">
                            <a class="menu-link upper" href="#">
                                <div>
                                    ${getCurrentCountryCode()}
                                </div>
                            </a>

                            <ul class="sub-menu-container">
                                <#list shippingCountries as country>
                                    <li class="menu-item">
                                        <a class="menu-link <#if currentShippingCountry == country.geoId>current</#if> upper"
                                           href="#"
                                           data-shipping-country="${country.geoId}">
                                            <div>
                                                ${country.code} - ${getCountryName(country)}
                                            </div>
                                        </a>
                                    </li>
                                </#list>
                            </ul>
                        </li>
                    </ul>

                </nav><!-- #primary-menu end -->

                <div class="header-misc col-lg-auto order-lg-4 ms-auto ms-lg-0 justify-content-lg-end ">

                    <!-- Top Login
                    ============================================= -->
                    <#if userLogin?has_content && userLogin.userLoginId != "anonymous">
                        <div id="top-account" class="header-misc-icon px-3">
                            <div class="dropdown mx-3 me-lg-0">
                                <a href="#" class="btn btn-secondary btn-sm dropdown-toggle" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="true"><i class="uil uil-user"></i></a>
                                <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="dropdownMenu1">
                                    <a class="dropdown-item text-start" href="<@ofbizUrl>viewprofile</@ofbizUrl>">${SystemLabelMap.CommonProfile}</a>
                                    <a class="dropdown-item text-start" href="<@ofbizUrl>returnList</@ofbizUrl>">${SystemLabelMap.CommonReturns}</a>
                                    <a class="dropdown-item text-start" href="<@ofbizUrl>orderhistory</@ofbizUrl>">${SystemLabelMap.OrderOrderHistory}</a>
                                    <div class="dropdown-divider"></div>
                                    <a class="dropdown-item text-start" href="<@ofbizUrl>logout</@ofbizUrl>">${SystemLabelMap.CommonLogout}<i class="bi-box-arrow-left"></i></a>
                                </ul>
                            </div>
                        </div>
                    <#else>
                        <div id="top-account" class="header-misc-icon px-3">
                            <a href="<@ofbizUrl>${checkLoginUrl}</@ofbizUrl>"><i class="bi-people" style="font-size: 20px;"></i></a>
                        </div><!-- #top-search end -->
                    </#if>

                    <div id="miniCartContainer">
                       <#include "cart/miniCart.ftl" />
                    </div>
                </div>

                <div class="primary-menu-trigger">
                    <button class="cnvs-hamburger" type="button" title="Open Mobile Menu">
                        <span class="cnvs-hamburger-box"><span class="cnvs-hamburger-inner"></span></span>
                    </button>
                </div>

                <!-- Primary Navigation
                ============================================= -->
                <nav class="primary-menu with-arrows col-lg-auto me-lg-auto order-lg-1">

                    <!-- Menu Left -->
                    <ul class="menu-container">
                        <li class="menu-item"><a class="menu-link upper" href="<@ofbizCatalogAltUrl productCategoryId="NEWIN"/>"><div>${SystemLabelMap.NewIn}</div></a></li>
                         <li class="menu-item mega-menu mega-menu-small"><a class="menu-link upper" href="#"><div>Shop</div></a>
                            <div class="mega-menu-content mega-menu-style-2">
                                <div class="container">
                                    <div class="row">
                                        <ul class="sub-menu-container mega-menu-column col-lg-6">
                                            <#list navCategories as cat>
                                                <#list cat.children as sub>
                                                    <ul class="sub-menu-container" data-sub="${sub}">
                                                        <li class="menu-item upper"><a class="menu-link" href="<@ofbizCatalogAltUrl productCategoryId="${sub.id}"/>"><div>${sub.name}</div></a></li>
                                                    </ul>
                                                </#list>
                                            </#list>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                         </li>

                        <li class="menu-item"><a class="menu-link upper" href="https://www.desphemmes.com"><div>${SystemLabelMap.Brand}</div></a></li>
                    </ul>

                </nav><!-- #primary-menu end -->

            </div>

        </div>

    </div>
    <div class="header-wrap-clone"></div>
</header><!-- #header end -->
