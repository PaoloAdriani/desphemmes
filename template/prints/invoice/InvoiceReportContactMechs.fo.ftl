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
<#escape x as x?xml>
<fo:table table-layout="fixed" width="100%" space-after="0.3in" space-before="1in" font-family="Monospaced">
   <fo:table-column column-width="3.5in"/>
    <fo:table-body>
      <fo:table-row >
        <fo:table-cell>
          <fo:block font-weight="bold" font-size="14px">${uiLabelMap.CommonTo}: </fo:block>
            <#if shippingAddress??>
                <#assign countryGeo = delegator.findOne("Geo", Static["org.apache.ofbiz.base.util.UtilMisc"].toMap("geoId", shippingAddress.countryGeoId), false) />
                <#if countryGeo??>
                    <#assign geoCode = countryGeo.geoCode! />
                </#if>
               <#assign province = shippingAddress.stateProvinceGeoId!"" >
               <fo:block>${shippingAddress.toName?capitalize!}</fo:block>
               <fo:block>${shippingAddress.address1?capitalize!}</fo:block>
               <fo:block>${shippingAddress.postalCode!} ${shippingAddress.city?capitalize!}  <#if province?contains("-") && shippingAddress.countryGeoId == "ITA">(${shippingAddress.stateProvinceGeoId[3..4]!})</#if>  <#if geoCode??>${geoCode}<#else>${shippingAddress.countryGeoId!}</#if>  </fo:block>
               <fo:block></fo:block>
               <fo:block>Tel. ${phone!} </fo:block>
                <#if orderEmailMap?? && (orderEmailMap?size > 0)>
                    <#list orderEmailMap.keySet() as key>
                        <fo:block>e-mail. ${orderEmailMap[key]!} </fo:block>
                    </#list>
                </#if>
            <#else>
                <fo:block/>
            </#if>
       </fo:table-cell>


    </fo:table-row>
  </fo:table-body>
</fo:table>
</#escape>
