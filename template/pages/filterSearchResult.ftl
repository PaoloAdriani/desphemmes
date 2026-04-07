<#include "base.ftl" />

<#macro page_head_title>

<!-- Document Title
============================================= -->
<title>Des Phemmes | Sito Uffiicale</title>

</#macro>

<#macro add_page_head_before_head_tag>

    <style type="text/css">

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
            flex-direction: column;
            align-items: stretch;
            gap: 10px;
          }

          .canvas-page-select {
            width: 100%;
          }

          .canvas-pagination-info {
            text-align: center;
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

          .product-title, .product-price{
            text-align: center;
          }

          .product-overlay-variants {
            display: none;
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

<#macro page_body>

<!-- Content
		============================================= -->
		<section id="content">
			<div class="content-wrap pb-0">
			    <div class="container-fluid mt-5">
                    <div class="row">
                        <#-- test filtri -->
                        <div class="col-md-2 upper">
                            <a class="button w-100 m-0 mb-5" href="<@ofbizCatalogAltUrl productCategoryId="${fromProductCategoryId!}"/>">${SystemLabelMap.RemoveFilter}</a>
                            <#if appliedFiltersByFeatureType??>
                                <#list appliedFiltersByFeatureType.entrySet() as appliedFilterEntry>
                                <div>
                                    <h5><#if (appliedFilterEntry.getKey() == "COLOR")>${SystemLabelMap.Color}<#elseif (appliedFilterEntry.getKey() == "SIZE")>${SystemLabelMap.Size}</#if></h5>
                                    <#list appliedFilterEntry.getValue() as appliedFeatureFilter>
                                        <ul>
                                            <li>${appliedFeatureFilter}</li>
                                        </ul>
                                    </#list>
                                </div>
                                </#list>
                            </#if>
                            <#--
                            <#if fromProductCategoryId??>
                                <div>
                                    <h5>${SystemLabelMap.Category}</h5>
                                    <ul>
                                        <li>${fromProductCategoryId!}</li>
                                    </ul>
                                </div>
                            </#if>
                            -->
                        </div>

                        <div class="col-md-10">
                                <div class="row shop grid-container" data-layout="fitRows">
                                    <#if productCategoryFilteredMembers?has_content>
                                        <#list productCategoryFilteredMembers as productCategoryMember>
                                            ${setRequestAttribute("optProductId", productCategoryMember.productId)}
                                            ${setRequestAttribute("productCategoryMember", productCategoryMember)}
                                            ${setRequestAttribute("listIndex", productCategoryMember_index)}
                                            ${screens.render(productsummaryScreen)}
                                        </#list>
                                    <#else>
                                        <hr />
                                        <div>
                                            ${SystemLabelMap.ProductNoProductsInThisCategory}
                                        </div>
                                    </#if>
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