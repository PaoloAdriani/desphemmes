<#include "../base.ftl" />

<#macro page_head_title>

<!-- Document Title
============================================= -->
<title>Des Phemmes | Sito Uffiicale</title>

</#macro>

<#macro page_body>

     <section id="slider" class="slider-element mt-3">
        <div class="masonry-thumbs grid-container row row-cols-6" data-big="3" data-lightbox="gallery">
            <#list 1..30 as i>
                <a class="grid-item" href="<@ofbizContentUrl>${assetspath}/images/campaign/adv2022/adv22_${i}.jpg</@ofbizContentUrl>" data-lightbox="gallery-item">
                    <div class="grid-inner">
                        <img src="<@ofbizContentUrl>${assetspath}/images/campaign/adv2022/adv22_${i}.jpg</@ofbizContentUrl>" alt="Gallery Thumb 1">
                        <div class="bg-overlay">
                            <div class="bg-overlay-content dark">
                                <span class="overlay-trigger-icon bg-light text-dark" data-hover-animate="zoomIn" data-hover-animate-out="zoomOut" data-hover-speed="400"><i class="uil uil-play"></i></span>
                            </div>
                        </div>
                    </div>
                </a>
            </#list>
        </div>
    </section>

</#macro>

<@display_page/>