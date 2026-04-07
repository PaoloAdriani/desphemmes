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

<#macro getReturnStatus statusId>
  <#switch statusId>

    <#case "RETURN_ACCEPTED">
      <span class="badge bg-success">${SystemLabelMap.ReturnAccepted}</span>
    <#break>

    <#case "RETURN_REQUESTED">
      <span class="badge bg-warning text-dark">${SystemLabelMap.ReturnRequested}</span>
    <#break>

    <#case "RETURN_CANCELLED">
      <span class="badge bg-danger">${SystemLabelMap.ReturnCancelled}</span>
    <#break>

    <#default>
      <span class="badge bg-secondary">${statusId}</span>

  </#switch>
</#macro>

<#macro returnItemsTableMobile items header>

<#list items as i>

  <div class="border-top pt-2 mt-2">

    <div><strong>Product:</strong> ${i.productId}</div>

    <div class="d-flex justify-content-between">
      <span>Qty: ${i.returnQuantity}</span>
      <span>
        <@ofbizCurrency amount=i.returnPrice isoCode=header.currencyUomId/>
      </span>
    </div>

    <div>
      <small class="text-muted">
        <@getReturnStatus i.statusId/>
      </small>
    </div>

  </div>

</#list>

</#macro>


<#macro returnCard header items idx>

<#assign collapseId = "return-mobile-" + header.returnId + "-" + idx>

<div class="card mb-3 shadow-sm">
  <div class="card-body">

    <!-- HEADER -->
    <div class="d-flex justify-content-between align-items-center">
      <strong>#${header.returnId}</strong>

      <span class="badge bg-secondary">
        <@getReturnStatus header.statusId/>
      </span>
    </div>

    <!-- INFO -->
    <div class="mt-2">
      <div>
        <strong>Order:</strong>
        <#if items?has_content>${items[0].orderId}</#if>
      </div>

      <div>
        <strong>Date:</strong>
        ${header.entryDate?string("dd/MM/yyyy")}
      </div>

      <div>
        <strong>Items:</strong> ${items?size}
      </div>
    </div>

    <!-- BUTTON -->
    <div class="mt-3">
      <button class="btn btn-sm btn-outline-primary w-100"
              data-bs-toggle="collapse"
              data-bs-target="#${collapseId}">
        Dettagli
      </button>
    </div>

    <!-- COLLAPSE -->
    <div class="collapse mt-3" id="${collapseId}">
      <@returnItemsTableMobile items=items header=header />
    </div>

  </div>
</div>

</#macro>


<#macro returnCards returns>

<#list returns as row>
  <@returnCard header=row.header items=row.items idx=row?index />
</#list>

</#macro>

<#macro returnItemsTable items header>

<table class="table table-sm mt-2">
  <thead>
    <tr>
      <th>Order</th>
      <th>Product</th>
      <th>Qty</th>
      <th>Price</th>
      <th>Status</th>
    </tr>
  </thead>

  <tbody>
    <#list items as i>
      <tr>
        <td>${i.orderId}</td>
        <td>${i.productId}</td>
        <td>${i.returnQuantity}</td>
        <td>
          <@ofbizCurrency amount=i.returnPrice isoCode=header.currencyUomId/>
        </td>
        <td>
          <@getReturnStatus i.statusId/>
        </td>
      </tr>
    </#list>
  </tbody>

</table>

</#macro>

<#macro returnRow header items idx>

<#assign collapseId = "return-" + header.returnId + "-" + idx>

<tr>
  <td>#${header.returnId}</td>

  <td>
    <#if items?has_content>
      ${items[0].orderId}
    </#if>
  </td>

  <td>
    <@getReturnStatus header.statusId/>
  </td>

  <td>
    ${header.entryDate?string("dd/MM/yyyy")}
  </td>

  <td>
    <button class="btn btn-sm btn-outline-primary"
            data-bs-toggle="collapse"
            data-bs-target="#${collapseId}">
      Dettagli
    </button>
  </td>
</tr>

<tr class="collapse" id="${collapseId}">
  <td colspan="5">

    <@returnItemsTable items=items header=header />

  </td>
</tr>

</#macro>

<#macro returnTable returns>

<div class="table-responsive">
<table class="table table-sm align-middle text-nowrap" style="min-width:700px;">

  <thead>
    <tr>
      <th>ID</th>
      <th>Order</th>
      <th>Status</th>
      <th>Date</th>
      <th></th>
    </tr>
  </thead>

  <tbody>

    <#list returns as row>
      <@returnRow header=row.header items=row.items idx=row?index />
    </#list>

  </tbody>

</table>
</div>

</#macro>

<#macro page_body>

<section id="content">
    <div class="content-wrap">
        <div class="container">

            <div class="card mb-0 upper">
                 <div class="card">
                    <div class="card-header">
                        <strong>${SystemLabelMap.EcommerceRequestHistory}</strong>
                    </div>

                    <div class="card-body">

                      <!-- DESKTOP -->
                      <div class="d-none d-md-block">
                        <@returnTable returns=returnList />
                      </div>

                      <!-- MOBILE -->
                      <div class="d-block d-md-none">
                        <@returnCards returns=returnList />
                      </div>

                    </div>

                </div>
            </div>
        </div>
    </div>
</section>

</#macro>
<@display_page/>