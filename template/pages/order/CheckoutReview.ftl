<#include "../base.ftl"/>

<#macro page_head_title>
<title>Des Phemmes | Checkout: revisione ordine</title>
</#macro>

<#macro add_page_head_before_head_tag>

    <style type="text/css">

    .button-loading {
      opacity: 0.7;
      cursor: wait;
    }

    </style>

    <script>
    window.OFBIZ_LABELS = {
        submittingOrder: "${SystemLabelMap.OrderSubmittingOrder}",
        commonError: "${SystemLabelMap.CommonErrorMessage2}",
        orderProcessing: "${SystemLabelMap.YoureOrderIsBeingProcessed}"
    };
    </script>

</#macro>

<#macro page_body>

<section id="content">
  <div class="content-wrap">
    <div class="container">
      <div class="card mb-0 upper">

        <h2 class="text-center">${SystemLabelMap.OrderFinalCheckoutReview}</h2>

        <#if cart?? && (cart.size() > 0)>

          ${screens.render("component://fisico/widget/FisicoScreens.xml#orderheader")}
          <br/>
          ${screens.render("component://fisico/widget/FisicoScreens.xml#orderitems")}

          <div class="row">
            <div class="col-12 d-flex justify-content-end">

              <form method="post"
                    action="<@ofbizUrl>checkMpAvailabilityBeforeProcess</@ofbizUrl>"
                    name="${parameters.formNameValue}"
                    id="processOrderForm">

                <#if (requestParameters.checkoutpage)?has_content>
                  <input type="hidden" name="checkoutpage" value="${requestParameters.checkoutpage}"/>
                </#if>

                <#if (requestAttributes.issuerId)?has_content>
                  <input type="hidden" name="issuerId" value="${requestAttributes.issuerId}"/>
                </#if>


                <button
                  type="submit"
                  id="processOrderButton"
                  name="processButton"
                  class="button button-small button-3d button-black m-0 upper">

                  ${SystemLabelMap.OrderSubmitOrder}&nbsp;<i class="bi-wallet2"></i>

                </button>


              </form>

            </div>
          </div>

        <#else>

          <p>${SystemLabelMap.OrderErrorShoppingCartEmpty}</p>

        </#if>

      </div>
    </div>
  </div>
</section>

</#macro>

<@display_page/>