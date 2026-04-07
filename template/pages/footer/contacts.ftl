<#include "../base.ftl" />

<#macro page_head_title>

<!-- Document Title
============================================= -->
<title>Des Phemmes | Sito Uffiicale</title>

</#macro>

<#macro page_body>

    <!-- Content
    ============================================= -->
    <section id="content">
    	<div class="content-wrap">
    		<div class="container">
    			<div class="row gx-5 col-mb-80">
    				<!-- Postcontent
    				============================================= -->
    				<main class="postcontent col-lg-9 upper">
    					<h3>Send us an Email</h3>
    					<div class="form-widget">
    						<div class="form-result"></div>
    						<form class="row mb-0" id="template-contactform" name="template-contactform" action="include/form.php" method="post">
    							<div class="form-process">
    								<div class="css3-spinner">
    									<div class="css3-spinner-scaler"></div>
    								</div>
    							</div>
    							<div class="col-md-4 form-group">
    								<label for="template-contactform-name">${SystemLabelMap.PartyToName}<small>*</small></label>
    								<input type="text" id="template-contactform-name" name="template-contactform-name" value="" class="form-control required">
    							</div>
    							<div class="col-md-4 form-group">
    								<label for="template-contactform-email">${SystemLabelMap.PartyEmailAddress}<small>*</small></label>
    								<input type="email" id="template-contactform-email" name="template-contactform-email" value="" class="required email form-control">
    							</div>
    							<div class="col-md-4 form-group">
    								<label for="template-contactform-phone">${SystemLabelMap.PartyPhoneNumber}</label>
    								<input type="text" id="template-contactform-phone" name="template-contactform-phone" value="" class="form-control">
    							</div>
    							<div class="w-100"></div>
    							<div class="col-md-8 form-group">
    								<label for="template-contactform-subject">${SystemLabelMap.CommonSubject}<small>*</small></label>
    								<input type="text" id="template-contactform-subject" name="subject" value="" class="required form-control">
    							</div>
    							<div class="w-100"></div>
    							<div class="col-12 form-group">
    								<label for="template-contactform-message">${SystemLabelMap.CommonMessage}<small>*</small></label>
    								<textarea class="required form-control" id="template-contactform-message" name="template-contactform-message" rows="6" cols="30"></textarea>
    							</div>
    							<div class="col-12 form-group d-none">
    								<input type="text" id="template-contactform-botcheck" name="template-contactform-botcheck" value="" class="form-control">
    							</div>
    							<div class="col-12 form-group">
    								<script src="https://www.google.com/recaptcha/api.js" async defer></script>
    								<div class="g-recaptcha" data-sitekey="6LfijgUTAAAAACPt-XfRbQszAKAJY0yZDjjhMUQT"></div>
    							</div>
    							<div class="col-12 form-group">
    								<button class="button button-small button-3d button-black m-0 upper" type="submit" id="template-contactform-submit" name="template-contactform-submit" value="submit">${SystemLabelMap.SendMessage}</button>
    							</div>
    							<input type="hidden" name="prefix" value="template-contactform-">
    						</form>
    					</div>
    				</main><!-- .postcontent end -->
    				<!-- Sidebar
    				============================================= -->
    				<aside class="sidebar col-lg-3">
    					<div class="sidebar-widgets-wrap">
    						<address>
    							<strong>${SystemLabelMap.Headquarters}:</strong><br>
    							Olmar and Mirta Spa<br>
    							Via Cocapana 9<br>
    							46026 Quistello(MN)<br>
    						</address>
    						<abbr title="Phone Number"><strong>${SystemLabelMap.PartyPhoneNumber}:</strong></abbr> +39 037661890<br>
    						<abbr title="Email Address"><strong>${SystemLabelMap.PartyEmailAddress}:</strong></abbr> customercare@fisico.it
    						<div class="widget border-0 pt-0">
    							<a href="https://www.facebook.com/FisicoOfficial/" class="social-icon si-small bg-dark h-bg-facebook">
    								<i class="fa-brands fa-facebook-f"></i>
    								<i class="fa-brands fa-facebook-f"></i>
    							</a>
    							<a href="https://www.instagram.com/fisico_official/" class="social-icon si-small bg-dark h-bg-instagram">
    								<i class="bi-instagram"></i>
    								<i class="bi-instagram"></i>
    							</a>
    						</div>
    					</div>
    				</aside><!-- .sidebar end -->
    			</div>
    		</div>
    	</div>
    </section><!-- #content end -->

</#macro>

<@display_page/>