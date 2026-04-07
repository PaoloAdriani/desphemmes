<#include "base.ftl" />

<#macro page_head_title>

<!-- Document Title
============================================= -->
<title>Des Phemmes | Categoria Articoli ${categoryContentWrapper.get("CATEGORY_NAME", "html")}</title>

</#macro>

<#macro add_page_head_before_head_tag>

    <style>

        /* ================================
           PAGINATION
        ================================ */

        .canvas-pagination {
          display: flex;
          align-items: center;
          gap: 14px;
          font-size: 14px;
        }

        .canvas-page-select {
          min-width: 120px;
          height: 36px;
        }

        .canvas-pagination-info {
          white-space: nowrap;
          font-size: 13px;
          color: #555;
        }

        .canvas-pagination-info strong {
          font-size: 14px;
          font-weight: 600;
        }

        .canvas-page-btn {
          padding: 6px 10px;
          font-size: 13px;
          text-decoration: none;
          border: 1px solid #ddd;
          background: #fff;
          color: #000;
        }

        .canvas-page-btn:hover {
          background: #f5f5f5;
        }

        .canvas-page-btn.disabled {
          opacity: 0.4;
          pointer-events: none;
        }

        .pagination-container {
          position: sticky;
          bottom: 0;
          background: #fff;
          padding: 12px 0;
          border-top: 1px solid #eee;
          z-index: 10;
        }

        @media (max-width: 768px) {

          .canvas-pagination {
            flex-direction: row;
            /*align-items: stretch;
            gap: 10px;*/
          }

          .canvas-page-select {
            width: 100%;
          }

          .canvas-pagination-info {
            /*text-align: center;*/
            display: none;
          }

          .canvas-page-btn {
            width: 100%;
            text-align: center;
          }

        }


        /* ================================
           PRODUCT IMAGE + OVERLAY DESKTOP
        ================================ */

        .product-image {
          position: relative;
          overflow: visible;
          padding-bottom: 10px;
        }

        .product-overlay-variants {

          position: absolute;
          bottom: 0;
          left: 0;
          right: 0;

          background: rgba(255,255,255,0.95);

          padding: 15px 10px;

          opacity: 0;
          transform: translateY(20px);

          transition: all 0.3s ease;

          pointer-events: none;

          z-index: 5;

        }

        /* hover desktop */
        .product-image:hover .product-overlay-variants {

          opacity: 1;
          transform: translateY(0);

          pointer-events: auto;

        }


        /* colors */

        .product-overlay-variants .product-colors {

          display: flex;
          justify-content: center;
          gap: 8px;
          margin-bottom: 10px;

        }

        .product-overlay-variants .color-swatch img {

          width: 30px;
          height: 30px;

          border-radius: 50%;
          border: 2px solid #ddd;

          cursor: pointer;

          transition: 0.2s;

        }

        .product-overlay-variants .color-swatch img:hover {

          border-color: #000;
          transform: scale(1.1);

        }


        /* sizes */

        .product-overlay-variants .product-sizes {

          display: flex;
          justify-content: center;
          gap: 6px;
          flex-wrap: wrap;

        }

        .product-overlay-variants .size-btn {

          padding: 4px 8px;

          border: 1px solid #ccc;

          background: #fff;

          font-size: 12px;

          cursor: pointer;

          transition: 0.2s;

        }

        .product-overlay-variants .size-btn:hover {

          background: #000;
          color: #fff;
          border-color: #000;

        }


        /* ================================
           MOBILE BEHAVIOR
        ================================ */

        /* hide overlay on mobile (we use modal instead) */
        @media (max-width: 768px) {

          .product-desc{
            flex-direction: column;
          }

          .product-title,.product-price{
             text-align: center;
          }

          .product-overlay-variants {
            display: none;
          }

          .pagination-container {
            position: static;
          }

        }




        /* mobile select button */

        .mobile-variants-btn {

          display: none;

        }

        @media (max-width: 768px) {

          .mobile-variants-btn {

            display: block;

            width: 100%;
            padding: 10px;

            border: 1px solid #000;

            background: #fff;

            font-size: 13px;

            margin-top: 8px;

          }

        }


        /* ================================
           MOBILE MODAL
        ================================ */

        .mobile-modal {

          display: none;

          position: fixed;
          inset: 0;

          z-index: 999;

        }

        .mobile-modal.active {
          display: block;
        }


        /* backdrop */

        .mobile-modal-backdrop {

          position: absolute;
          inset: 0;

          background: rgba(0,0,0,0.4);

        }


        /* modal panel */

        .mobile-modal-content {

          position: absolute;

          bottom: 0;
          left: 0;
          right: 0;

          background: #fff;

          padding: 20px;

          max-height: 70vh;

          overflow-y: auto;

          border-radius: 12px 12px 0 0;

        }


        /* ⭐ CRITICAL FIX:
           show overlay inside modal
        */

        .mobile-modal-content .product-overlay-variants {

          display: block !important;

          position: static !important;

          opacity: 1 !important;

          transform: none !important;

          pointer-events: auto !important;

        }


        /* close button */

        .mobile-modal-close {

          width: 100%;

          padding: 12px;

          border: 1px solid #000;

          background: #fff;

          margin-bottom: 15px;

        }


    </style>

</#macro>

<#macro paginationControlsNoAjax>
  <#local viewIndexMax = Static["java.lang.Math"]
      .ceil((listSize)?double / viewSize?double) />

  <#if viewIndexMax?int gt 1>
    <div class="row d-flex">
      <div class="col-sm-12 d-flex justify-content-center justify-content-md-end">
        <div class="canvas-pagination d-flex p-1">

          <!-- SELECT PAGINA -->
          <select class="canvas-page-select"
                  onchange="location.href='?viewIndex=' + this.value + '&viewSize=${viewSize}'">
            <#list 0..viewIndexMax-1 as i>
              <option value="${i}" <#if i == viewIndex>selected</#if>>
                ${SystemLabelMap.CommonPage} ${i + 1}
              </option>
            </#list>
          </select>

          <!-- INFO RANGE -->
          <span class="canvas-pagination-info">
            <strong>${lowIndex}–${highIndex}</strong>
            <span class="text-muted">
              ${SystemLabelMap.CommonOf} ${listSize}
            </span>
          </span>

          <!-- PREV -->
          <#if viewIndex?int gt 0>
            <a class="canvas-page-btn"
               href="?viewIndex=${viewIndex-1}&viewSize=${viewSize}">
              ${SystemLabelMap.CommonPrevious}
            </a>
          <#else>
            <span class="canvas-page-btn disabled">
              ${SystemLabelMap.CommonPrevious}
            </span>
          </#if>

          <!-- NEXT -->
          <#if highIndex?int lt listSize?int>
            <a class="canvas-page-btn"
               href="?viewIndex=${viewIndex+1}&viewSize=${viewSize}">
              ${SystemLabelMap.CommonNext}
            </a>
          <#else>
            <span class="canvas-page-btn disabled">
              ${SystemLabelMap.CommonNext}
            </span>
          </#if>

        </div>
      </div>
    </div>
  </#if>
</#macro>

<#macro filterPanel>

    <div class="body-overlay"></div>

    	<div id="side-panel">

    		<div id="side-panel-trigger-close" class="side-panel-trigger"><a href="#"><i class="bi-x-lg"></i></a></div>

    		    <div class="side-panel-wrap">

    		        <div class="widget">

                        <div>
                            <#if filterMap?? && (filterMap?size > 0)>
                                <form action="<@ofbizUrl>filterSearch</@ofbizUrl>" method="POST">
                                    <input type="hidden" name="fromProductCategoryId" value="${productCategoryId!}">
                                    <#list filterMap.entrySet() as filterEntry>
                                        <div class="mb-4 upper">
                                            <h5><#if (filterEntry.getKey() == "COLOR")>${SystemLabelMap.Color}<#elseif (filterEntry.getKey() == "SIZE")>${SystemLabelMap.Size}</#if></h5>
                                            <#list filterEntry.getValue().entrySet() as filterValueEntry>
                                                <div>
                                                    <label>
                                                        <input type="checkbox" name="SRC_${filterEntry.key}" value="${filterValueEntry.key}">
                                                        ${filterValueEntry.value}
                                                    </label>
                                                </div>
                                            </#list>
                                        </div>
                                    </#list>
                                    <button class="button w-100 m-0 upper" type="submit">${SystemLabelMap.ApplyFilter}</button>
                                </form>
                            <#else>
                                <div>
                                    <p>${SystemLabelMap.UnavailableFilter}</p>
                                </div>
                            </#if>
                        </div>

                    </div>
    		    </div>
    		</div>
    	</div>
    </div>

</#macro>

<#macro page_body>

<!-- Content
		============================================= -->
		<section id="content">
			<div class="content-wrap pb-0">
			    <div class="container-fluid">
                    <div class="col-12 mb-4">
			            <a href="#" class="side-panel-trigger upper">Filtri&nbsp;<i class="bi-sliders2"></i></a>
                    </div>

                    <@filterPanel/>

                    <div class="alert alert-dismissible alert-danger mb-0 mb-5" id="productError" style="display:none; text-align: center;">
                        <p id="messageText"></p>
                    </div>

                    <div class="row">
                        <div class="col-md-12" data-assetpath="${assetspath}">
                                <div class="row shop grid-container" data-layout="fitRows">
                                    <#if productCategoryMembers?has_content>
                                        <#list productCategoryMembers as productCategoryMember>
                                            ${setRequestAttribute("optProductId", productCategoryMember.productId)}
                                            ${setRequestAttribute("productCategoryMember", productCategoryMember)}
                                            ${setRequestAttribute("listIndex", productCategoryMember_index)}
                                            ${setRequestAttribute("assetspath", assetspath)}
                                            ${screens.render(productsummaryScreen)}
                                        </#list>
                                    <#else>
                                        <hr />
                                        <div>
                                            ${SystemLabelMap.ProductNoProductsInThisCategory}
                                        </div>
                                    </#if>
                                </div>
                            <div class="pagination-container mt-5">
                                <@paginationControlsNoAjax />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section><!-- #content end -->

</#macro>

<#macro js_script_after_footer>



</#macro>

<@display_page/>