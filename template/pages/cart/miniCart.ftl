<#assign shoppingCart = session.getAttribute("shoppingCart")!>
<#if shoppingCart?has_content>
  <#assign shoppingCartSize = shoppingCart.size()>
<#else>
  <#assign shoppingCartSize = 0>
</#if>

<div id="top-cart" data-minicart-url="<@ofbizUrl>ajaxMiniCart</@ofbizUrl>">

    <#if (shoppingCartSize > 0)>

        <a href="#" id="top-cart-trigger" class="position-relative">
            <i class="bi-bag" style="font-size: 20px;"></i>
            <span class="top-cart-number">${shoppingCart.getTotalQuantity()}</span>
        </a>

        <div class="top-cart-content">

            <div class="top-cart-title position-relative">
                <h4>${SystemLabelMap.ShoppingCart}</h4>
                <button type="button" class="top-cart-close">&times;</button>
            </div>

            <div class="top-cart-items">

                <#list shoppingCart.items() as cartLine>

                    <#assign cartProduct = cartLine.getParentProduct()!cartLine.getProduct()!>

                    <#assign cartSmallImageUrl = Static["org.apache.ofbiz.product.product.ProductContentWrapper"].getProductContentAsText(cartProduct, "SMALL_IMAGE_URL", locale, dispatcher, "")!"" />

                    <div class="top-cart-item">

                        <div class="top-cart-item-image">
                            <a href="<@ofbizCatalogAltUrl productId=cartProduct.productId/>">
                                <img src="<@ofbizContentUrl>${assetspath}${cartSmallImageUrl!'/images/defaultImage.png'}</@ofbizContentUrl>">
                            </a>
                        </div>

                        <div class="top-cart-item-desc">
                            <div class="top-cart-item-desc-title font-sz-small">
                                <a href="<@ofbizCatalogAltUrl productId=cartProduct.productId/>" class="fw-normal">${cartLine.getName(dispatcher)}</a>
                                <span class="top-cart-item-price d-block"><@ofbizCurrency amount=cartLine.getDisplayItemSubTotal() isoCode=shoppingCart.getCurrency()/></span>
                            </div>
                        </div>

                        <div class="top-cart-item-quantity fw-semibold">
                            ${cartLine.getQuantity()?string.number}
                        </div>

                    </div>
                </#list>
            </div>

            <div class="top-cart-action">

                <span class="top-checkout-price fw-semibold text-dark font-sz-small">${SystemLabelMap.CommonSubTotal}: <@ofbizCurrency amount=shoppingCart.getDisplaySubTotal() isoCode=shoppingCart.getCurrency()/></span>

                <a href="<@ofbizUrl>view/showCart</@ofbizUrl>" class="button button-dark button-small m-0 font-sz-small">${SystemLabelMap.ShoppingCart}&nbsp;<i class="bi-arrow-right"></i></a>
            </div>

        </div>

    <#else>

        <a href="#" id="top-cart-trigger" class="position-relative" style="text-transform: uppercase;letter-spacing: 0;font-weight: 600;font-size: 13px;text-shadow: none;">
            <i class="bi-bag" style="font-size: 20px;"></i>
        </a>

        <div class="top-cart-content">

            <div class="top-cart-title">
                <h4>${SystemLabelMap.ShoppingCart}</h4>
            </div>

            <div class="top-cart-items">

                <p style="text-align: center;">${SystemLabelMap.ShoppingCartEmpty}</p>

            </div>

            <div class="top-cart-action">

                <span class="top-checkout-price fw-semibold text-dark font-sz-small">${SystemLabelMap.TotalPrice}: <@ofbizCurrency amount=shoppingCart.getDisplaySubTotal() isoCode=shoppingCart.getCurrency()/></span>

                <a href="<@ofbizUrl>view/showCart</@ofbizUrl>" class="button button-dark button-small m-0 p-2 font-sz-small">${SystemLabelMap.ShoppingCart}&nbsp;<i class="bi-arrow-right"></i></a>
            </div>

        </div>
    </#if>

</div>
