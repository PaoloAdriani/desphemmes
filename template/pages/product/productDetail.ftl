<#include "../base.ftl"/>

<#macro page_head_title>

<!-- Document Title
============================================= -->
<title>Des Phemmes | ${productContentWrapper.get("PRODUCT_NAME", "html")!}</title>

</#macro>

<#macro add_page_head_before_head_tag>

     <style>

            .color-dots {
              display:flex;
              gap:10px;
            }

            .color-dot img{
              width:28px;
              height:28px;
              border-radius:50%;
              border:2px solid #ddd;
            }

            .color-dot.active img{
              border:1px solid #000;
            }

            .product-colors {
              height: 20px;
              display: flex;
              flex-direction: row;
              justify-content: center;
              gap: 10px;
              margin-bottom: 15px;
              margin-top: 2px;
            }

            .color-swatch img {
              width: 45px;
              height: 20px;
              border-radius: 50%;
              border: 2px solid #ddd;
              transition: 0.2s;
              cursor: pointer;
            }

            .color-swatch img:hover {
              border-color: #000;
              transform: scale(1.08);
            }

             .product-sizes {
               display: flex;
               justify-content: center;
               gap: 8px;
             }

            .size-btn {
              padding: 1px 5px;
              border: 1px solid #ccc;
              text-decoration: none;
              color: #333;
              transition: 0.2s;
            }

            .size-btn:hover {
              background: #000;
              color: #fff;
            }

            .product .color-swatch img,
            .product .color-dot img {
                width: 20px !important;
                height: 20px !important;
                object-fit: cover;
            }


            .also-bought-products .product {
                font-size: 0.9rem;
            }

            .also-bought-products .product-image {
                max-height: 150px;
            }

            .also-bought-products h4 {
                font-size: 1.1rem;
                margin-bottom: 15px;
            }

            /* mobile select button */

            .mobile-variants-btn {

              display: none;

            }

            .mobile-modal-close{
                display: none;
            }

     </style>

</#macro>


<#assign currentPageProduct = product />

<#-- Upgrades/Up-Sell/Cross-Sell -->
<#macro associated assocProducts beforeName showName afterName formNamePrefix targetRequestName>
    <#local pageProduct = currentPageProduct />

    <#assign listIndex = 0/>
    <#local targetRequest = "product" />
    <#if targetRequestName?has_content>
        <#local targetRequest = targetRequestName />
    </#if>
    <#if assocProducts?has_content>
        <#list assocProducts as productAssoc>
            <#if productAssoc.productId == product.productId>
              <#local assocProductId = productAssoc.productIdTo />
            <#else>
              <#local assocProductId = productAssoc.productId />
            </#if>
            <#if productAssoc.reason?has_content>
              ${setRequestAttribute("highlightLabel", productAssoc.reason)}
            </#if>
            ${setRequestAttribute("optProductId", assocProductId)}
            ${setRequestAttribute("listIndex", listIndex)}
            ${setRequestAttribute("formNamePrefix", formNamePrefix)}
            <#if targetRequestName?has_content>
                ${setRequestAttribute("targetRequestName", targetRequestName)}
            </#if>
            ${screens.render(productsummaryScreen)}
            <#local product = pageProduct />
            <#local listIndex = listIndex + 1 />

        </#list>

        ${setRequestAttribute("optProductId", "")}
        ${setRequestAttribute("formNamePrefix", "")}
        ${setRequestAttribute("targetRequestName", "")}

    </#if>
</#macro>


<#macro showUnavailableVarients>
  <#if unavailableVariants??>
    <ul>
      <#list unavailableVariants as prod>
        <#assign features = prod.getRelated("ProductFeatureAppl", null, null, false)/>
        <li>
          <#list features as feature>
            <em>${feature.getRelatedOne("ProductFeature", false).description}</em><#if feature_has_next>, </#if>
          </#list>
          <span>${SystemLabelMap.ProductItemOutOfStock}</span>
        </li>
      </#list>
    </ul>
  </#if>
</#macro>

<#macro sizetable>

    <!-- Centered modal -->
    <div class="col-sm-6 mt-5">
        <a class="me-2 upper" data-bs-toggle="modal" data-bs-target=".bs-example-modal-centered" style="cursor: pointer; text-decoration: underline !important;">${SystemLabelMap.SizeGuide}</a>
        <div class="modal fade text-start bs-example-modal-centered" tabindex="-1" role="dialog" aria-labelledby="centerModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered modal-xl">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="btn-close btn-sm"  data-bs-dismiss="modal"></button>
                    </div>

                    <div class="modal-body text-center p-0">
                        <img src="<@ofbizContentUrl>${assetspath}/images/${SystemLabelMap.SizeTableImage}</@ofbizContentUrl>" class="img-fluid" style="max-height: 80vh;" alt="${SystemLabelMap.SizeGuide}">
                    </div>
                </div>
            </div>
        </div>
    </div>

</#macro>


<#assign price = priceMap! />


<#macro page_body>

<!-- Page Title
============================================= -->

<#assign img1Url><@ofbizContentUrl>${assetspath}${(largeImageUrl!blankSku)?trim}</@ofbizContentUrl></#assign>

<#assign img2Url><@ofbizContentUrl>${assetspath}${(productAdditionalImage2!blankSku)?trim}</@ofbizContentUrl></#assign>

<#assign img3Url><@ofbizContentUrl>${assetspath}${(productAdditionalImage3!blankSku)?trim}</@ofbizContentUrl></#assign>

<#assign img4Url><@ofbizContentUrl>${assetspath}${(productAdditionalImage4!blankSku)?trim}</@ofbizContentUrl></#assign>

<#assign blankSkuUrl><@ofbizContentUrl>${assetspath}${(blankSku)?trim}</@ofbizContentUrl></#assign>

<#assign blankCropUrl><@ofbizContentUrl>${assetspath}${(blankCrop)?trim}</@ofbizContentUrl></#assign>

<#assign productName = productContentWrapper.get("PRODUCT_NAME", "html") />

<section id="content">
    <div class="content-wrap">
	    <div class="container">

	        <div class="alert alert-dismissible alert-danger mb-0 mb-5" id="productError" style="display:none; text-align: center;">
	            <p id="messageText"></p>
	        </div>

			<div class="single-product">
				<div class="product">
					<div class="row gutter-40">
                        <div class="col-lg-6 col-md-7">

                            <!-- Product Single - Gallery
                            ============================================= -->
                            <div class="product-image">
                                <div class="fslider" data-arrows="false" data-thumbs="true" data-pagi="false" data-slideshow="false" data-animation="slide">
                                    <div class="flexslider">
                                        <div class="slider-wrap" data-lightbox="gallery">
                                            <div class="slide" data-thumb="${img1Url}"><a href="${img1Url}"  data-lightbox="gallery-item"><img src="${img1Url}" onerror="this.onerror=null;this.src='${blankSkuUrl}';" alt="${productName}"></a></div>
                                            <div class="slide" data-thumb="${img2Url}"><a href="${img2Url}"  data-lightbox="gallery-item"><img src="${img2Url}" onerror="this.onerror=null;this.src='${blankSkuUrl}';" alt="${productName}"></a></div>
                                            <div class="slide" data-thumb="${img3Url}"><a href="${img3Url}"  data-lightbox="gallery-item"><img src="${img3Url}" onerror="this.onerror=null;this.src='${blankSkuUrl}';" alt="${productName}"></a></div>
                                            <div class="slide" data-thumb="${img4Url}"><a href="${img4Url}"  data-lightbox="gallery-item"><img src="${img4Url}" onerror="this.onerror=null;this.src='${blankSkuUrl}';" alt="${productName}"></a></div>
                                        </div>
                                    </div>
                                </div>
                            </div><!-- Product Single - Gallery End -->
                        </div><!-- end class col-md-7-->

                        <div class="col-lg-6 col-md-5">

                            <nav aria-label="breadcrumb" class="mb-5">
                              <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="<@ofbizUrl>index</@ofbizUrl>">Home</a></li>
                                <#if productCategory?has_content>
                                    <#assign prcatCntWrapper = Static["org.apache.ofbiz.product.category.CategoryContentWrapper"].makeCategoryContentWrapper(productCategory, request) />
                                  <li class="breadcrumb-item">
                                    <a href="<@ofbizCatalogAltUrl productCategoryId=categoryId/>">${prcatCntWrapper.get("CATEGORY_NAME", "html")!}</a>
                                  </li>
                                </#if>
                              </ol>
                            </nav>

                            <!-- Product Single - Short Description
                            ============================================= -->
                            <p class="upper productName m-0">${productName}</p>

                            <p class="upper productId">${product.productId!}</p>

                            <div class="d-flex align-items-center justify-content-between mb-2">
                                <!-- Product Single - Price
                                ============================================= -->

                                <div class="product-price d-flex">
                                     <#if price.specialPromoPrice??>
                                        <#if price.specialPromoPrice?? && price.listPrice?? && price.specialPromoPrice?double < price.listPrice?double>
                                            <div class="priceDel me-1"><del><ins><@ofbizCurrency amount=price.listPrice isoCode=price.currencyUsed/></ins></del></div>
                                        </#if>
                                     <#else>
                                        <#if price.listPrice??>
                                            <div class="priceValid"><ins><@ofbizCurrency amount=price.listPrice isoCode=price.currencyUsed/></ins></div>
                                        </#if>
                                     </#if>

                                    <#if price.specialPromoPrice??>
                                        <div class="priceValid">
                                            <ins><@ofbizCurrency amount=price.specialPromoPrice isoCode=price.currencyUsed /></ins>
                                        </div>
                                    </#if>
                                </div><!-- Product Single - Price End -->
                            </div>

                            <br>

                            <h5 class="fw-medium mb-3 upper">
                                ${SystemLabelMap.Color}
                                <span class="product-color-value ms-1 fw-semibold"></span>
                            </h5>

                            <div id="color-dots">
                                <#assign colorImg = productContentWrapper.get("ADDITIONAL_IMAGE_1", "url")! />
                                <#assign colorName = productContentWrapper.get("COMMENTS", "html")! />

                                <a href="<@ofbizCatalogAltUrl productId=product.productId productCategoryId=categoryId! />"
                                   class="color-dot active"
                                   title="${colorName}">
                                   <img src="<@ofbizContentUrl>${assetspath}${colorImg!blankCrop}</@ofbizContentUrl>" onerror="this.onerror=null;this.src='${blankCropUrl}';"/>
                                </a>

                                <#list upSellProducts as upSell>
                                    <#assign prodIdTo = delegator.findOne("Product", {"productId": upSell.productIdTo}, false)>
                                    <#assign pcw = Static["org.apache.ofbiz.product.product.ProductContentWrapper"].makeProductContentWrapper(prodIdTo, request) />

                                    <#assign colorImg = pcw.get("ADDITIONAL_IMAGE_1", "url")! />
                                    <#assign colorName = pcw.get("COMMENTS", "html")! />

                                    <#assign url>
                                        <@ofbizCatalogAltUrl productId=prodIdTo.productId productCategoryId=categoryId! />
                                    </#assign>

                                    <a href="${url}"
                                       class="color-dot" data-bs-toggle="tooltip" data-bs-placement="bottom" title="${colorName}"
                                       title="${colorName}">
                                       <img src="<@ofbizContentUrl>${assetspath}${colorImg!blankCrop}</@ofbizContentUrl>" onerror="this.onerror=null;this.src='${blankCropUrl}';"/>
                                    </a>
                                </#list>
                            </div>

                             <div id="addItemForm">
                                <form method="post" action="<@ofbizUrl>ajaxAddItem</@ofbizUrl>" name="addform" style="margin: 0;">
                                    <#assign inStock = true />
                                    <#-- Variant Selection -->
                                    <#if "Y" == product.isVirtual!?upper_case>
                                        <#if !product.virtualVariantMethodEnum?? || "VV_VARIANTTREE" == product.virtualVariantMethodEnum>
                                            <#if variantTree?? && (variantTree.size() &gt; 0)>
                                                <div class="col-sm-6 mt-5">
                                                    <h5 class="fw-medium mb-3 upper">${SystemLabelMap.Size}</h5>
                                                        <div role="group">
                                                            <#if sizeProductFeatureAndAppls?has_content>
                                                                <div>
                                                                    <#list sizeProductFeatureAndAppls as sizeProductFeatureAndAppl>
                                                                        <#assign sizeId = sizeProductFeatureAndAppl.productFeatureId>
                                                                        <#assign prodVars = variantTree[sizeId]![]>
                                                                        <#if prodVars?? && prodVars?size gt 0>
                                                                            <#assign prodVar = prodVars[0]/>
                                                                            <input class="btn-check" type="radio" name="bag-size" id="bag-size-${sizeProductFeatureAndAppl.productFeatureId}" autocomplete="off" value="${sizeProductFeatureAndAppl.productFeatureId}" data-product-variant="${prodVar}">
                                                                            <label for="bag-size-${sizeProductFeatureAndAppl.productFeatureId}" class="btn btn-sm btn-outline-secondary fw-normal ls-0 text-transform-none">${sizeId}</label>
                                                                            &nbsp;
                                                                        <#else>
                                                                            <#if unavailableVariants??>
                                                                                <#list unavailableVariants as prod>
                                                                                    <#assign features = prod.getRelated("ProductFeatureAppl", null, null, false)/>
                                                                                    <#list features as feature>
                                                                                        <#assign featureSize = feature.getRelatedOne("ProductFeature", false).description>
                                                                                        <#if sizeId == featureSize>
                                                                                            <input class="btn-check" type="radio" name="bag-size" id="bag-size-${featureSize}" autocomplete="off" value="${featureSize}" data-productVariant="${prod.productId}">
                                                                                            <label for="bag-size-${featureSize}" class="btn btn-sm btn-outline-secondary fw-normal ls-0 text-transform-none disabled" disabled="disabled"><del>${featureSize}</del></label>
                                                                                            &nbsp;
                                                                                        </#if>
                                                                                    </#list>
                                                                                </#list>
                                                                            </#if>
                                                                        </#if>
                                                                    </#list>
                                                                </div>
                                                            </#if>
                                                        </div><#-- end role="group">
                                                </div><#-- end class="col-sm-6 mt-5" -->

                                                <@sizetable/>

                                                <div class="alert alert-warning text-center upper p-1 my-1">
                                                    <small><i class="bi-exclamation-diamond-fill"></i>&nbsp;${SystemLabelMap.AttentionMessage}: ${SystemLabelMap.AttentionMessageSize}</small>
                                                </div>

                                                <input type="hidden" name="product_id" value="${product.productId}"/>
                                                <input type="hidden" name="add_product_id" id="add_product_id" value="NULL"/>

                                            <#else>

                                                <div class="col-sm-6 mt-3">
                                                    <h5 class="fw-medium mb-3 upper">${SystemLabelMap.Size}</h5>
                                                    <#if unavailableVariants??>
                                                        <#list unavailableVariants as prod>
                                                            <#assign features = prod.getRelated("ProductFeatureAndAppl", Static["org.apache.ofbiz.base.util.UtilMisc"].toMap("productFeatureTypeId","SIZE"), null, false)/>
                                                            <#list features as feature>
                                                                <#assign featureSize = feature.getRelatedOne("ProductFeature", false).description>
                                                                <input class="btn-check" type="radio" name="bag-size" id="bag-size-${featureSize}" autocomplete="off" value="${featureSize}" data-productVariant="${prod.productId}">
                                                                <label for="bag-size-${featureSize}" class="btn btn-sm btn-outline-secondary fw-normal ls-0 text-transform-none disabled" disabled="disabled"><del>${featureSize}</del></label>
                                                                &nbsp;
                                                            </#list>
                                                        </#list>
                                                    </#if>
                                                </div>

                                                <@sizetable/>

                                                <div class="quantity mt-3">
                                                    <input type="button" value="-" class="minus">
                                                    <input type="number" step="1" min="1" name="quantity" value="1" title="Qty" class="qty" disabled="disabled">
                                                    <input type="button" value="+" class="plus">
                                                </div>

                                                <a name="addToCartDisabled" class="add-to-cart button m-0 upper border border-dark" style="background-color: white; color: #000; cursor: not-allowed; pointer-events: none;" disabled="disabled">${SystemLabelMap.OutOfStock}</a>

                                                <#assign inStock = false />
                                            </#if><#-- end variantTree?? && (variantTree.size() &gt; 0 -->
                                        </#if><#-- end !product.virtualVariantMethodEnum?? || "VV_VARIANTTREE" == product.virtualVariantMethodEnum -->
                                    </#if><#-- end "Y" == product.isVirtual!?upper_case -->
                             </div><#-- end id="addItemForm" -->

                                   <#-- check to see if the product requires inventory check and has inventory -->
                                   <#if product.virtualVariantMethodEnum! != "VV_FEATURETREE">
                                        <#if inStock>
                                            <div class="form-group mt-5">

                                                <div class="input-group">
                                                    <span class="input-group-btn">
                                                        <div class="quantity">
                                                            <input type="button" value="-" class="minus">
                                                            <input type="number" step="1" min="1" name="quantity" value="1" title="Qty" class="qty">
                                                            <input type="button" value="+" class="plus">
                                                        </div>
                                                        <#--<a href="javascript:addItem()" id="addToCart" name="addToCart" class="add-to-cart button m-0 mt-2 upper">${SystemLabelMap.AddToCart}</a>-->
                                                        <a id="addToCart" name="addToCart" class="add-to-cart button m-0 mt-2 upper">${SystemLabelMap.AddToCart}&nbsp;<i class="bi-cart-plus"></i></a>
                                                    </span>
                                                </div>
                                            </div>
                                        <#else>
                                            <#--<@showUnavailableVarients/>-->
                                            <#--<a name="addToCartDisabled" class="add-to-cart button m-0 upper" style="background-color: red;" disabled="disabled">${SystemLabelMap.OutOfStock}</a>-->
                                        </#if><#-- end inStock -->
                                   </#if><#-- end if product.virtualVariantMethodEnum! != "VV_FEATURETREE -->
                                   </form>

                            <br>
                            <div class="line my-3 mt-16"></div>

                            <div class="toggle mb-3">
                                <div class="toggle-header">
                                    <div class="toggle-icon">
                                        <i class="toggle-closed uil uil-plus"></i>
                                        <i class="toggle-open uil uil-minus"></i>
                                    </div>
                                    <div class="toggle-title upper">
                                        ${SystemLabelMap.ArticleDescription}
                                    </div>
                                </div>
                                <div class="toggle-content toggle-content-padding">
                                    <p>${productContentWrapper.get("DESCRIPTION", "html")!}</p>
                                    <p>${productContentWrapper.get("INGREDIENTS", "html")!}</p>
                                </div>
                            </div>


                            <div class="toggle mb-3">
                                <div class="toggle-header">
                                    <div class="toggle-icon">
                                        <i class="toggle-closed uil uil-plus"></i>
                                        <i class="toggle-open uil uil-minus"></i>
                                    </div>
                                    <div class="toggle-title upper">
                                        ${SystemLabelMap.ModelInfo}
                                    </div>
                                </div>
                                <div class="toggle-content toggle-content-padding">
                                    <p>${SystemLabelMap.ModelInfoDescription}</p>
                                </div>
                            </div>

                            <#--
                            <div class="toggle mt-3 mb-3">
                                <div class="toggle-header">
                                    <div class="toggle-icon">
                                        <i class="toggle-closed uil uil-plus"></i>
                                        <i class="toggle-open uil uil-minus"></i>
                                    </div>
                                    <div class="toggle-title upper">
                                        ${SystemLabelMap.ProductCare}
                                    </div>
                                </div>
                                <div class="toggle-content toggle-content-padding">
                                    <p><b>${SystemLabelMap.ProductCareOne}</b></p>
                                    <p>${SystemLabelMap.ProductCareOneDescription}</p>

                                    <p><b>${SystemLabelMap.ProductCareTwo}</b></p>
                                    <p>${SystemLabelMap.ProductCareTwoDescription}</p>

                                    <p><b>${SystemLabelMap.ProductCareThree}</b></p>
                                    <p>${SystemLabelMap.ProductCareThreeDescription}</p>

                                    <p><b>${SystemLabelMap.ProductCareFour}</b></p>
                                    <p>${SystemLabelMap.ProductCareFourDescription}</p>

                                    <p><b>${SystemLabelMap.ProductCareFive}</b></p>
                                    <p>${SystemLabelMap.ProductCareFiveDescription}</p>
                               	</div>
                            </div>
                            -->

                            <div class="toggle mb-3">
                                <div class="toggle-header">
                                    <div class="toggle-icon">
                                        <i class="toggle-closed uil uil-plus"></i>
                                        <i class="toggle-open uil uil-minus"></i>
                                    </div>
                                    <div class="toggle-title upper">
                                        ${SystemLabelMap.ShippingReturns}
                                    </div>
                                </div>
                                <div class="toggle-content toggle-content-padding">
                                    <p><b>${SystemLabelMap.ShippingReturnsOneDescription}</b></p>
                                    <p>${SystemLabelMap.ShippingReturnsTwoDescription}</p>
                                    <p>${SystemLabelMap.ShippingReturnsThreeDescription}</p>
                                </div>
                            </div>

                            <div class="line my-3"></div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <#if alsoBoughtProducts?? && alsoBoughtProducts.size() gt 0>
        <div class="section mb-0">
            <div class="container mw-md text-center">
                <h4>${SystemLabelMap.AlsoBought}</h4>
                <div class="row justify-content-center gutter-1">
                    <@associated assocProducts=alsoBoughtProducts beforeName="" showName="N" afterName="${SystemLabelMap.AlsoBought}"
                    formNamePrefix="alsob" targetRequestName="alsobought" />
                </div>
            </div>
        </div>
    </#if>

    <#assign product = currentPageProduct />

    <#if crossSellProducts?? && crossSellProducts.size() gt 0>
        <div class="section mb-0">
            <div class="container mw-md text-center">
                <h4>${SystemLabelMap.CrossSell}</h4>
                <div class="row justify-content-center gutter-1">
                    <@associated assocProducts=crossSellProducts beforeName="" showName="N" afterName="${SystemLabelMap.CrossSell}"
                    formNamePrefix="cssl" targetRequestName="crosssell" />
                </div>
            </div>
        </div>
    </#if>

</section>

</#macro>

<@display_page/>