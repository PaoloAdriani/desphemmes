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
<#include "../base.ftl"/>

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
                <#if orderHeader?has_content>
                    ${screens.render("component://fisico/widget/FisicoScreens.xml#orderheader")}
                    <br />
                    ${screens.render("component://fisico/widget/FisicoScreens.xml#orderitems")}
                <#else>
                  <h3>${SystemLabelMap.OrderSpecifiedNotFound}.</h3>
                </#if>
            </div>
        </div>
    </div>
</section>

</#macro>
<@display_page/>