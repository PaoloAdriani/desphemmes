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
<#assign currentShippingCountry = (request.getSession().getAttribute("shippingCountryGeoId"))!"ITA" />

<#assign shippingCountries = [
    {"geoId": "AUT", "code": "AT", "nameIt": "Austria",       "nameEn": "Austria"},
    {"geoId": "BEL", "code": "BE", "nameIt": "Belgio",        "nameEn": "Belgium"},
    {"geoId": "BGR", "code": "BG", "nameIt": "Bulgaria",      "nameEn": "Bulgaria"},
    {"geoId": "HRV", "code": "HR", "nameIt": "Croazia",       "nameEn": "Croatia"},
    {"geoId": "CYP", "code": "CY", "nameIt": "Cipro",         "nameEn": "Cyprus"},
    {"geoId": "EST", "code": "EE", "nameIt": "Estonia",       "nameEn": "Estonia"},
    {"geoId": "FIN", "code": "FI", "nameIt": "Finlandia",     "nameEn": "Finland"},
    {"geoId": "FRA", "code": "FR", "nameIt": "Francia",       "nameEn": "France"},
    {"geoId": "DEU", "code": "DE", "nameIt": "Germania",      "nameEn": "Germany"},
    {"geoId": "GRC", "code": "GR", "nameIt": "Grecia",        "nameEn": "Greece"},
    {"geoId": "IRL", "code": "IE", "nameIt": "Irlanda",       "nameEn": "Ireland"},
    {"geoId": "ITA", "code": "IT", "nameIt": "Italia",        "nameEn": "Italy"},
    {"geoId": "LVA", "code": "LV", "nameIt": "Lettonia",      "nameEn": "Latvia"},
    {"geoId": "LTU", "code": "LT", "nameIt": "Lituania",      "nameEn": "Lithuania"},
    {"geoId": "LUX", "code": "LU", "nameIt": "Lussemburgo",   "nameEn": "Luxembourg"},
    {"geoId": "MLT", "code": "MT", "nameIt": "Malta",         "nameEn": "Malta"},
    {"geoId": "NLD", "code": "NL", "nameIt": "Paesi Bassi",   "nameEn": "Netherlands"},
    {"geoId": "POL", "code": "PL", "nameIt": "Polonia",       "nameEn": "Polonia"},
    {"geoId": "PRT", "code": "PT", "nameIt": "Portogallo",    "nameEn": "Portugal"},
    {"geoId": "SVK", "code": "SK", "nameIt": "Slovacchia",    "nameEn": "Slovakia"},
    {"geoId": "SVN", "code": "SI", "nameIt": "Slovenia",      "nameEn": "Slovenia"},
    {"geoId": "ESP", "code": "ES", "nameIt": "Spagna",        "nameEn": "Spain"}
]/>

<#function getCountryName country>
    <#if locale.toString()?starts_with("it")>
        <#return country.nameIt>
    <#else>
        <#return country.nameEn>
    </#if>
</#function>

<#function getCurrentCountryCode>
    <#list shippingCountries as c>
        <#if c.geoId == currentShippingCountry>
            <#return c.code>
        </#if>
    </#list>
    <#return "IT">
</#function>
