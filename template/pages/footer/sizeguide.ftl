<#include "../base.ftl" />

<#macro page_head_title>

<!-- Document Title
============================================= -->
<title>Des Phemmes | Sito Uffiicale</title>

</#macro>

<#macro page_body>

    <!-- Page Title
           ============================================= -->
    <section class="page-title page-title-parallax parallax scroll-detect dark page-title-center include-header bg-overlay-mask" style="padding: 170px 0 100px;">
        <img src="<@ofbizContentUrl>${assetspath}/images/fisico_boutique.jpg</@ofbizContentUrl>" class="parallax-bg">
           	<div class="container">
           		<div class="page-title-row">
           			<div class="page-title-content">
           				<h1 class="text-uppercase">${SystemLabelMap.SizeGuide}</h1>
           			</div>
           			<nav aria-label="breadcrumb">
           				<ol class="breadcrumb">
           					<li class="breadcrumb-item"><a href="<@ofbizUrl>index</@ofbizUrl>">Home</a></li>
           					<li class="breadcrumb-item active" aria-current="page">${SystemLabelMap.SizeGuide}</li>
           				</ol>
           		    </nav>
           		</div>
           </div>
    </section><!-- .page-title end -->

    <section id="slider" class="slider-element boxed-slider">
     	<div class="container">
     	    <div>
                <a href="#" class="d-block">
                    <img class="w-100 rounded" src="<@ofbizContentUrl>${assetspath}/images/tabella-taglie_ITA.jpg</@ofbizContentUrl>" alt="Image">
                </a>
            </div>

            <div>
                <a href="#" class="d-block">
                    <img class="w-100 rounded" src="<@ofbizContentUrl>${assetspath}/images/tabella-taglie_ENG.jpg</@ofbizContentUrl>" alt="Image">
                </a>
            </div>
     	</div>
    </section>

</#macro>

<@display_page/>