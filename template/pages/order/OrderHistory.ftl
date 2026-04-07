<#include "../base.ftl"/>

<#macro page_head_title>
<title>Des Phemmes | Sito Uffiicale</title>
</#macro>

<#-- ========================= -->
<#-- MACRO: TABLE DESKTOP -->
<#-- ========================= -->
<#macro orderTable orders>
<div class="table-responsive">
  <table class="table">
    <thead class="table-light">
      <tr>
        <th>${SystemLabelMap.CommonDate}</th>
        <th>${SystemLabelMap.OrderOrder} ${SystemLabelMap.CommonNbr}</th>
        <th>${SystemLabelMap.CommonAmount}</th>
        <th>${SystemLabelMap.CommonStatus}</th>
        <th>${SystemLabelMap.OrderInvoices}</th>
        <th></th>
      </tr>
    </thead>
    <tbody>
    <#if orders?has_content>
      <#list orders as orderHeader>
        <@orderRow orderHeader=orderHeader />
      </#list>
    <#else>
      <tr>
        <td colspan="6">${SystemLabelMap.OrderNoOrderFound}</td>
      </tr>
    </#if>
    </tbody>
  </table>
</div>
</#macro>

<#-- ========================= -->
<#-- MACRO: SINGOLA RIGA -->
<#-- ========================= -->
<#macro orderRow orderHeader>
  <#assign status = orderHeader.getRelatedOne("StatusItem", true) />
  <#assign invoices = EntityQuery.use(delegator)
      .from("OrderItemBilling")
      .where("orderId", orderHeader.orderId)
      .orderBy("invoiceId")
      .queryList()! />
  <#assign distinctInvoiceIds =
      Static["org.apache.ofbiz.entity.util.EntityUtil"]
      .getFieldListFromEntityList(invoices, "invoiceId", true)>

  <tr>
    <td>${orderHeader.orderDate.toString()}</td>
    <td>${orderHeader.orderId}</td>
    <td>
      <@ofbizCurrency amount=orderHeader.grandTotal isoCode=orderHeader.currencyUom />
    </td>
    <td>${status.get("description",locale)}</td>

    <td>
      <#if distinctInvoiceIds?has_content>
        <#list distinctInvoiceIds as invoiceId>
          <div>
            <a href="<@ofbizUrl>invoice.pdf?invoiceId=${invoiceId}</@ofbizUrl>"
               class="btn btn-sm btn-outline-secondary">
              ${invoiceId} PDF
            </a>
          </div>
        </#list>
      </#if>
    </td>

    <td>
      <a href="<@ofbizUrl>orderstatus?orderId=${orderHeader.orderId}</@ofbizUrl>"
         class="btn btn-sm btn-outline-primary">
        ${SystemLabelMap.CommonView}
      </a>
    </td>
  </tr>
</#macro>

<#-- ========================= -->
<#-- MACRO: CARD MOBILE -->
<#-- ========================= -->
<#macro orderCards orders>
<#if orders?has_content>
  <#list orders as orderHeader>
    <@orderCard orderHeader=orderHeader />
  </#list>
<#else>
  <div class="alert alert-info">
    ${SystemLabelMap.OrderNoOrderFound}
  </div>
</#if>
</#macro>

<#-- ========================= -->
<#-- MACRO: SINGOLA CARD -->
<#-- ========================= -->
<#macro orderCard orderHeader>
  <#assign status = orderHeader.getRelatedOne("StatusItem", true) />
  <#assign invoices = EntityQuery.use(delegator)
      .from("OrderItemBilling")
      .where("orderId", orderHeader.orderId)
      .orderBy("invoiceId")
      .queryList()! />
  <#assign distinctInvoiceIds =
      Static["org.apache.ofbiz.entity.util.EntityUtil"]
      .getFieldListFromEntityList(invoices, "invoiceId", true)>

  <div class="card mb-3 shadow-sm">
    <div class="card-body">

      <div class="d-flex justify-content-between align-items-center">
        <strong>#${orderHeader.orderId}</strong>
        <span class="badge bg-secondary">
          ${status.get("description",locale)}
        </span>
      </div>

      <div class="mt-2">
        <div>
          <strong>${SystemLabelMap.CommonDate}:</strong>
          ${orderHeader.orderDate.toString()}
        </div>
        <div>
          <strong>${SystemLabelMap.CommonAmount}:</strong>
          <@ofbizCurrency amount=orderHeader.grandTotal isoCode=orderHeader.currencyUom />
        </div>
      </div>

      <#if distinctInvoiceIds?has_content>
        <div class="mt-2">
          <strong>${SystemLabelMap.OrderInvoices}:</strong>
          <#list distinctInvoiceIds as invoiceId>
            <div>
              <a href="<@ofbizUrl>invoice.pdf?invoiceId=${invoiceId}</@ofbizUrl>"
                 class="btn btn-sm btn-outline-secondary mt-1">
                ${invoiceId} PDF
              </a>
            </div>
          </#list>
        </div>
      </#if>

      <div class="mt-3">
        <a href="<@ofbizUrl>orderstatus?orderId=${orderHeader.orderId}</@ofbizUrl>"
           class="btn btn-sm btn-outline-primary w-100">
          ${SystemLabelMap.CommonView}
        </a>
      </div>

    </div>
  </div>
</#macro>

<#-- ========================= -->
<#-- PAGE BODY -->
<#-- ========================= -->
<#macro page_body>

<section id="content">
  <div class="content-wrap">
    <div class="container">

      <div class="card mb-0 upper">
        <div class="card">
          <div class="card-header">
            <strong>${SystemLabelMap.OrderSalesHistory}</strong>
          </div>

          <div class="card-body">

            <!-- DESKTOP -->
            <div class="d-none d-md-block">
              <@orderTable orders=orderHeaderList />
            </div>

            <!-- MOBILE -->
            <div class="d-block d-md-none">
              <@orderCards orders=orderHeaderList />
            </div>

          </div>
        </div>
      </div>

    </div>
  </div>
</section>

</#macro>

<@display_page/>