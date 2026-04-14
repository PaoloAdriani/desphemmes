<#include "base.ftl" />

<#macro page_head_title>

<!-- Document Title
============================================= -->
<title>Des Phemmes | Sito Ufficiale</title>

</#macro>

<#macro add_page_head_after_head_tag>

    <style type="text/css">
        /*
         .swiper-slide {
            position: relative;
         }

        .slide-link {
            position: absolute;
            inset: 0;
            z-index: 2;
        }

        .swiper-slide-bg {

            position: absolute;
            inset: 0;
            z-index: 1;
        }

        .slider-caption {
            position: relative;
            z-index: 3;
            pointer-events: none;
        }

        .swiper-slide-bg img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }
*/

         .category-banner {
             position: relative;
             width: 100%;
         }

         .banner-img {
             width: 100%;
             height: auto;
             display: block;
         }

         .banner-caption {
             position: absolute;
             inset: 0 0 0 1.1rem;
             display: flex;
             align-items: flex-start;
             justify-content: flex-start;
             text-align: left;
             color: white;
             pointer-events: none;
         }

        .category-banner-link {
            display: block;
            text-decoration: none;
            color: inherit;
        }



    </style>



</#macro>

<#macro page_body>

    <#include "homepage/bannerHome01.ftl" />
    <#include "homepage/categoryRow01.ftl" />
    <#include "homepage/categoryRow02.ftl" />
    <#include "homepage/categoryRow03.ftl" />
    <#include "homepage/bannerHome02.ftl" />
    <#--<#include "homepage/categoryRow04.ftl" />-->


</#macro>

<@display_page/>