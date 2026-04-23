<!-- Footer
============================================= -->
<footer id="footer" class="border-0">
	<div class="container-fluid">
		<!-- Footer Widgets
		============================================= -->
		<div class="footer-widgets-wrap p-2">
			<div class="row">
                <#--
                <div class="col-lg-2 col-md-4 col-6">
                    <div class="widget">
                        <h4 class="text-uppercase">Olmar and Mirta Spa</h4>
                        <p>Via Cocapana 9 - 46026 Quistello(MN)</p>
                        <abbr title="Phone Number"><strong>Phone:</strong></abbr> +39 037661890<br>
                        <abbr title="Email Address"><strong>Email:</strong></abbr> customercare@fisico.it<br>
                        <a href="#" class="social-icon si-small bg-dark h-bg-facebook mt-4 me-2">
                        	<i class="fa-brands fa-facebook-f"></i>
                        	<i class="fa-brands fa-facebook-f"></i>
                        </a>
                        <a href="#" class="social-icon si-small bg-dark h-bg-instagram mt-4 me-2">
                        	<i class="bi-instagram"></i>
                        	<i class="bi-instagram"></i>
                        </a>
                    </div>
                </div>
                -->
				<div class="col-4 d-flex justify-content-md-end">
					<div class="widget">
						<h4 class="ls-0 mb-3 text-transform-none footerlinks-title">Servizio clienti</h4>
						<ul class="list-unstyled iconlist m-0">
							<li class="footerlink"><a href="<@ofbizUrl>sizeguide</@ofbizUrl>" class="upper">${SystemLabelMap.SizeGuide}</a></li>
						</ul>
					</div>
				</div>
				<div class="col-4 d-flex justify-content-md-center">
					<div class="widget">
						<h4 class="ls-0 mb-3 text-transform-none footerlinks-title">Area Legale</h4>
						<ul class="list-unstyled iconlist m-0">
							<li class="footerlink"><a href="<@ofbizUrl>salesconditions</@ofbizUrl>" class="upper">${SystemLabelMap.SalesConditions}</a></li>
							<li class="footerlink"><a href="<@ofbizUrl>privacy</@ofbizUrl>" class="upper">${SystemLabelMap.PrivacyPolicy}</a></li>
							<li class="footerlink"><a href="<@ofbizUrl>cookie</@ofbizUrl>" class="upper">${SystemLabelMap.CookieManagement}</a></li>
						</ul>
					</div>
				</div>
				<div class="col-4 d-flex justify-content-md-start">
					<div class="widget">
						<h4 class="ls-0 mb-3 text-transform-none footerlinks-title">Corporate</h4>
						<ul class="list-unstyled iconlist m-0">
							<li class="footerlink"><a href="https://www.desphemmes.com" class="upper" target="_blank">${SystemLabelMap.Brand}</a></li>

						</ul>
					</div>
				</div>
				<#--div class="col-lg-3">
					<div class="widget">
						<h4 class="ls-0 mb-3 text-transform-none">Instagram Feed</h4>
						<div id="instagram-photos" class="instagram-photos masonry-thumbs grid-container row row-cols-4 customjs" data-user="blog.canvastemplate" data-count="10"></div>
					</div>
				</div-->
			</div>
		</div><!-- .footer-widgets-wrap end -->
	</div>

    <#include "copyrights.ftl" />
    <#include "pageController.ftl" />

</footer>