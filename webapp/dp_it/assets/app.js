/**
 * JS_LIB_
 * @author MpStyle - info@mpstyle.it
 */
// namespace
var JS_LIB_ = JS_LIB_ || {};
JS_LIB_.cons = {};
//constant data
const consologstyle = 'background: #222; color: #bada55;font-weight:800';
const consologstyleprimarymess = 'background: yellow; color: #000;font-weight:800;font-style: italic;';
JS_LIB_.cons = function() {

};


JS_LIB_.filterSearch = function () {

    let event;

    this.init = function(){

        event = new JS_LIB_.event();

        event.showMobileVariants();
        event.closeMobileVariants();

    }
}


JS_LIB_.checkoutReview = function () {

    let event;

    this.init = function(){

        event = new JS_LIB_.event();
        event.sendOrder();

    }
}

JS_LIB_.editContactMech = function () {

    let countrySelect;
    let stateSelect;
    let util;

    this.init = function () {

        util = new JS_LIB_.util();

        countrySelect =
            document.getElementById("editcontactmechform_countryGeoId");

        stateSelect =
            document.getElementById("editcontactmechform_stateProvinceGeoId");

        if (!countrySelect || !stateSelect)
            return;

        const selectedCountry =
            countrySelect.dataset.selected;

        if (selectedCountry)
            countrySelect.value = selectedCountry;

        countrySelect.addEventListener("change", function () {

            loadStates(this.value);

        });

        if (countrySelect.value)
            loadStates(countrySelect.value);

    };

    async function loadStates(countryGeoId) {

        stateSelect.innerHTML =
            '<option>Caricamento...</option>';

        try {

            const response =
                await fetch(
                    OFBIZ_URL_GET_STATES +
                    "?countryGeoId=" +
                    encodeURIComponent(countryGeoId)
                );

            const text =
                await response.text();

            const data =
                util.parseOfbizJson(text);

            renderStates(data);

        }
        catch (error) {

            console.error(error);

            stateSelect.innerHTML =
                '<option>Errore caricamento</option>';
        }
    }

    function renderStates(data) {

        const selectedState =
            stateSelect.dataset.selected;

        stateSelect.innerHTML =
            '<option value="">Seleziona una provincia</option>';

        if (!data.stateList)
            return;

        data.stateList.forEach(function (stateString) {

            const parts =
                stateString.split(": ");

            if (parts.length !== 2)
                return;

            const geoName = parts[0];
            const geoId = parts[1];

            const option =
                document.createElement("option");

            option.value = geoId;
            option.textContent = geoName;

            if (geoId === selectedState)
                option.selected = true;

            stateSelect.appendChild(option);

        });
    }

};

JS_LIB_.checkoutPayment = function() {

	var checkoutPayment_obj = this;

	this.init = function() {

        checkoutPayment_obj.paymentMethodSelected();

	};

	this.paymentMethodSelected = function(){

	    document.querySelectorAll(".js-submit").forEach(button => {

            button.addEventListener("click", function(e) {

                const selectedPayment =
                    document.querySelector('input[name="checkOutPaymentId"]:checked');

                if (!selectedPayment) {

                    e.preventDefault();

                    document.getElementById("paymentError")
                        .style.display = "block";

                    return;
                }

                // submit normale
                document.getElementById("checkoutInfoForm").submit();

            });

        });

        document.querySelectorAll('input[name="checkOutPaymentId"]')
        .forEach(radio => {

            radio.addEventListener("change", () => {

                document.getElementById("paymentError")
                    .style.display = "none";

            });

        });

	}


}

JS_LIB_.checkoutShippingOptions = function() {

	let event;

	this.init = function() {

		event = new JS_LIB_.event();
        event.submitForm();

	};

}


JS_LIB_.checkoutShippingAddress = function() {

	let event;

    this.init = function() {

        event = new JS_LIB_.event();
        event.submitForm();

    };

}


JS_LIB_.newCustomer = function() {

    let countrySelect;
    let stateSelect;
    let emailInput;
    let usernameInput;
    let unuseEmailCheckbox;
    let passwordInput;

    let lastFocusedName = null;

    const newCustomer_obj = this;

    let util;

    this.init = function() {

        util = new JS_LIB_.util();

        countrySelect = document.getElementById("newuserform_countryGeoId");
        stateSelect = document.getElementById("newuserform_stateProvinceGeoId");

        emailInput = document.getElementById("CUSTOMER_EMAIL");
        usernameInput = document.getElementById("USERNAME");
        unuseEmailCheckbox = document.getElementById("UNUSEEMAIL");
        passwordInput = document.getElementById("PASSWORD");

        bindEvents();

        if (countrySelect && countrySelect.value)
            loadStates(countrySelect.value);

        //hideShowUsaStates();

        syncUsernameWithEmail();
    };

    function bindEvents() {

        if (countrySelect)
            countrySelect.addEventListener("change", function() {

                loadStates(this.value);
                //hideShowUsaStates();

            });

        if (emailInput)
            emailInput.addEventListener("input", syncUsernameWithEmail);

        if (unuseEmailCheckbox)
            unuseEmailCheckbox.addEventListener("change", syncUsernameWithEmail);

        if (usernameInput)
            usernameInput.addEventListener("focus", clickUsername);

        if (passwordInput)
            passwordInput.addEventListener("focus", function() {

                lastFocusedName = "PASSWORD";

            });

        document
            .querySelectorAll("#newuserform input, #newuserform select")
            .forEach(function(el) {

                el.addEventListener("focus", function() {

                    lastFocusedName = this.name;

                });

            });
    }

    function syncUsernameWithEmail() {

        if (!usernameInput || !emailInput || !unuseEmailCheckbox)
            return;

        if (unuseEmailCheckbox.checked)
        {
            usernameInput.value = emailInput.value;

            usernameInput.readOnly = true;
        }
        else
        {
            usernameInput.readOnly = false;
        }
    }

    function clickUsername() {

        if (!unuseEmailCheckbox)
            return;

        if (unuseEmailCheckbox.checked)
        {
            if (lastFocusedName === "UNUSEEMAIL")
            {
                passwordInput.focus();
            }
            else
            {
                passwordInput.focus();
            }
        }
    }

    function hideShowUsaStates() {

        if (!countrySelect || !stateSelect)
            return;

        if (countrySelect.value === "USA" ||
            countrySelect.value === "UMI")
        {
            stateSelect.style.display = "block";
        }
        else
        {
            stateSelect.style.display = "none";
        }
    }

    async function loadStates(countryGeoId)
    {
        if (!stateSelect)
            return;

        stateSelect.innerHTML =
            '<option value="">Caricamento...</option>';

        try
        {
            const response =
                await fetch(
                    OFBIZ_URL_GET_STATES +
                    "?countryGeoId=" + countryGeoId
                );

            const text =
                await response.text();

            const data =
                util.parseOfbizJson(text);

            stateSelect.innerHTML =
                '<option value="">Seleziona uno stato</option>';

            if (data.stateList)
            {
                data.stateList.forEach(function(stateString) {

                    const parts =
                        stateString.split(": ");

                    if (parts.length !== 2)
                        return;

                    const geoName = parts[0];
                    const geoId = parts[1];

                    const option =
                        document.createElement("option");

                    option.value = geoId;
                    option.textContent = geoName;

                    stateSelect.appendChild(option);

                });
            }

        }
        catch(error)
        {
            console.error(error);

            stateSelect.innerHTML =
                '<option value="">Errore caricamento</option>';
        }
    }

};


JS_LIB_.categoryDetail = function() {

    var category_obj = this;
    let event;
    let util;

    this.init = function(){

        event = new JS_LIB_.event();
        util = new JS_LIB_.util();

        category_obj.addItemFromCategory();
        //category_obj.initMiniCart();

        event.showMobileVariants();
        event.closeMobileVariants();

    }

    this.addItemFromCategory = function(){

        $("a[id^='size-the']").on("click", function() {

            let fullId = $(this).attr("id");

            let formId = fullId.replace("size-", "");

            var form = $(this).closest("form");

            var action = form.attr("action");

            console.log("************ action: "+action);

            var data = form.serialize();

            $.ajax({
                    url: action,
                    type: "POST",
                    data: data,
                    dataType: "text",

                    success: function(responseText){

                        let resp = util.parseOfbizJson(responseText);

                        if (resp._ERROR_MESSAGE_ || resp._ERROR_MESSAGE_LIST_) {
                            // Mostra l'errore all'utente
                            let errorMsg = resp._ERROR_MESSAGE_
                                || resp._ERROR_MESSAGE_LIST_.join(", ");

                            util.showUnavailableProductMessage(errorMsg);

                            setTimeout(function(){ util.closeUnavailableProductMessage()},3000);

                        } else {
                           category_obj.refreshMiniCart();
                        }
                    },

                    error: function(data){
                        console.log(data);
                    }
                });
            });
    }

   this.refreshMiniCart = function(){

           let miniCartUrl = document.getElementById('top-cart').dataset.minicartUrl;

           $.ajax({

               url: miniCartUrl,
               type: "GET",

               success: function(html){

                   $("#miniCartContainer").html(html);

                   $("#top-cart").addClass("top-cart-open");
               }
           });
   }


   this.initMiniCart = function(){

       $(document).off("click", "#top-cart-trigger").on("click", "#top-cart-trigger", function(e){

           e.preventDefault();

           $("#top-cart").toggleClass("open");

       });
   }


}


/*
*  faq page
*/
JS_LIB_.faq = function() {

	var faq_obj = this;

	let util;

	util = new JS_LIB_.util();

	this.init = function(){

	    faq_obj.activeVoices();

	}

	this.activeVoices = function () {

        var $faqItems = jQuery('#faqs .faq');

        if( window.location.hash != '' ) {
            var getFaqFilterHash = window.location.hash;
            var hashFaqFilter = getFaqFilterHash.split('#');
            if( $faqItems.hasClass( hashFaqFilter[1] ) ) {
                jQuery('.grid-filter li').removeClass('activeFilter');
                jQuery( '[data-filter=".'+ hashFaqFilter[1] +'"]' ).parent('li').addClass('activeFilter');
                var hashFaqSelector = '.' + hashFaqFilter[1];
                $faqItems.css('display', 'none');
                if( hashFaqSelector != 'all' ) {
                    jQuery( hashFaqSelector ).fadeIn(500);
                } else {
                    $faqItems.fadeIn(500);
                }
            }
        }

        jQuery('.grid-filter a').on( 'click', function(){
            jQuery('.grid-filter li').removeClass('activeFilter');
            jQuery(this).parent('li').addClass('activeFilter');
            var faqSelector = jQuery(this).attr('data-filter');
            $faqItems.css('display', 'none');
            if( faqSelector != 'all' ) {
                jQuery( faqSelector ).fadeIn(500);
            } else {
                $faqItems.fadeIn(500);
            }
            return false;
       });

	}

};


JS_LIB_.showCart = function() {

    var showCart_obj = this;

    this.init = function(){

        showCart_obj.removeItemSelected();

    }

    this.removeItemSelected = function(){

         $(".remove").on("click", function(e){

             e.preventDefault();

             let index = $(this).data("index");

             let form = document.forms["cartform"];

             form.selectedItem.value = index;
             form.removeSelected.value = "true";

             form.submit();

         });
    }


};


JS_LIB_.productDetail = function() {

	var product_obj = this;

	let util;
	//let event;

	this.init = function() {

		util = new JS_LIB_.util();

		event = new JS_LIB_.event();

        util.hideProductDetailPageAlert();

		product_obj.addItem();

		product_obj.setupThumbs();

		//event.showMobileVariants();
        //event.closeMobileVariants();

	};


    this.addItem = function() {

            /*
         $("#addToCart").click(function (e) {

                let checkRadio = document.querySelector('input[name="bag-size"]:checked');

                if (checkRadio === null) {
                    e.preventDefault();
                    util.showProductDetailPageAlert();
                    return;
                }

                const productVariant = checkRadio.dataset.productVariant;

                $('#add_product_id').val(productVariant);

                document.addform.submit();

         });
         */


         $("#addToCart").click(function (e) {

             let checkRadio = document.querySelector('input[name="bag-size"]:checked');

             if (checkRadio === null) {
                 e.preventDefault();
                 util.showProductDetailPageAlert();
                 return;
             }

             const productVariant = checkRadio.dataset.productVariant;

             $('#add_product_id').val(productVariant);

             var form = $(this).closest("form");

             var action = form.attr("action");

             var data = form.serialize();

             //console.log("form: "+form);
             //console.log("action: "+action);
             //console.log("data: "+data);

            $.ajax({
                    url: action,
                    type: "POST",
                    data: data,
                    dataType: "text",
                    /*
                    success: function(){
                        product_obj.refreshMiniCart();
                    },

                    error: function(data){
                        console.log('%c data : ' + data, consologstyle);
                        util.showUnavailableProductMessage();
                    }
                    */
                        success: function(responseText) {

                            console.log("tipo:", typeof responseText);
                            console.log("valore:", responseText);

                            var json = util.parseOfbizJson(responseText);

                            if (json._ERROR_MESSAGE_ || json._ERROR_MESSAGE_LIST_) {
                                // Mostra l'errore all'utente
                                var errorMsg = json._ERROR_MESSAGE_
                                    || json._ERROR_MESSAGE_LIST_.join(", ");

                                util.showUnavailableProductMessage(errorMsg);

                                setTimeout(function(){ util.closeUnavailableProductMessage()},3000);

                            } else {
                                product_obj.refreshMiniCart();
                            }
                        },

                        error: function(xhr) {
                            console.log("Errore HTTP:", xhr);
                        }
            });

         });

        $('input[name="bag-size"]').on('change', function () {
            const selected = document.querySelector('input[name="bag-size"]:checked');
            if (selected) {
                util.hideProductDetailPageAlert();
            }
        });

    };

    this.setupThumbs = function(){

        var thumbs = document.querySelectorAll('.flex-control-nav.flex-control-thumbs img');
        var blankSkuUrl = '/dp_it/assets/images/blank_sku.jpg';

        thumbs.forEach(function(thumb) {
            thumb.addEventListener('error', function() {
                this.onerror = null; // Previeni loop infinito
                this.src = blankSkuUrl;
            });
        });

    }

    this.refreshMiniCart = function(){

           var miniCartUrl = document.getElementById('top-cart').dataset.minicartUrl;

           console.log("************* miniCartUrl: "+miniCartUrl);

           $.ajax({

               url: miniCartUrl,
               type: "GET",

               success: function(html){

                   $("#miniCartContainer").html(html);

                   $("#top-cart").addClass("top-cart-open");
               }
           });
       }

}; //end product class


/*
 * INIT GENERIC EVENT
 * */
JS_LIB_.event = function() {

	var event = this;

	this.submitForm = function(){

        document.addEventListener("click", function(e){

            var el = e.target.closest(".js-submit");

            if(!el) return;

            e.preventDefault();

            var form = document.forms["checkoutInfoForm"];

            form.action = el.dataset.url;

            form.submit();

        });

    }

    this.sendOrder = function(){

        const form = document.getElementById("processOrderForm");
        const button = document.getElementById("processOrderButton");

        if(!form || !button) return;

        let submitting = false;

        form.addEventListener("submit", function(e) {

            if (submitting) {

              e.preventDefault();

              showErrorAlert(
                 OFBIZ_LABELS.commonError,
                 OFBIZ_LABELS.orderProcessing
              );

              return;
            }

            submitting = true;

            button.disabled = true;
            button.innerText = OFBIZ_LABELS.submittingOrder;
            button.classList.add("button-loading");

        });

    }

    this.showMobileVariants = function() {

       $("button[id^='mobileVarsel_']").on('click', function(){

            let aId = $(this).attr("id");
            let productId = aId.substring((aId.indexOf("_")+1));

            let product = $(this).closest(".product")[0];
            let modal = document.getElementById("mobileVarModal_" + productId);
            let modalContent = modal.querySelector(".mobile-modal-content");
            let variants = product.querySelector(".product-overlay-variants");

            /* salva posizione originale */
            modal._variantsOriginalParent = variants.parentNode;
            modal._variantsNextSibling = variants.nextSibling;
            modal._origProduct = product;

           /* FIX CRITICO: sposta modal nel body */
           document.body.appendChild(modal);

           /* sposta varianti nel modal */
           modalContent.appendChild(variants);

           modal.classList.add("active");

       });
    }

   this.closeMobileVariants = function() {
       $("button[id^='mobileVarModalCloseBtn_']").on("click", function(){

           let aId = $(this).attr("id");
           let productId = aId.substring((aId.indexOf("_")+1));

          let modal = document.getElementById("mobileVarModal_" + productId);
          let variants = modal.querySelector(".product-overlay-variants");

          /* ripristina varianti */
          if (modal._variantsNextSibling && modal._origProduct) {
              modal._variantsOriginalParent.insertBefore(
                  variants,
                  modal._variantsNextSibling
              );
          } else {
              modal._variantsOriginalParent.appendChild(variants);
          }
          modal.classList.remove("active");

      });

   }

   this.miniCart = function() {

       document.addEventListener("click", function(e){

           const cart = document.getElementById("top-cart");

           // OPEN / TOGGLE
           if (e.target.closest("#top-cart-trigger")) {
               e.preventDefault();
               e.stopPropagation();
               cart?.classList.toggle("top-cart-open");
           }

           // CLOSE BUTTON
           if (e.target.closest(".top-cart-close")) {
               cart?.classList.remove("top-cart-open");
           }

           // CLICK OUTSIDE
           if (!e.target.closest("#top-cart")) {
               cart?.classList.remove("top-cart-open");
           }

       });

   };



};


JS_LIB_.util = function() {

	let utilObj = this;

	this.getPage = function() {

    	var url = $('meta[name=pcn]').attr("content");

    	return url;
    };

    this.showProductDetailPageAlert = function() {

        $('.alert-warning').show();
    }

    this.hideProductDetailPageAlert = function() {

        $('.alert-warning').hide();
    }

    this.parseOfbizJson = function(text){

        console.log("text: "+text);

        return JSON.parse(
                text.startsWith("//")
                    ? text.substring(2)
                    : text
            );
    }

    this.showUnavailableProductMessage = function(errorText){
        $('#productError').show();
        $('#messageText').html(errorText);

    }

    this.closeUnavailableProductMessage = function(){
        $('#productError').hide();
    }

    this.getWebapp = function(){

        return $('meta[name=webapp]').attr("content");

    };

    this.mapCountryToWebapp = function(geoId) {

       console.log("geoId: "+geoId);

       return (geoId === "ITA")  ? "dp_it" : "dp_eu";

    }

    this.getCookie = function(name) {
        var match = document.cookie.match(new RegExp('(^| )' + name + '=([^;]+)'));

        console.log("******** match: "+match);

        return match ? match[2] : null;
    }

    this.chooseLanguage = function(){

        document.querySelectorAll('[data-locale]').forEach(function(el) {
            el.addEventListener('click', function(e) {
                e.preventDefault();
                document.getElementById('newLocaleInput').value = this.dataset.locale;
                document.getElementById('chooseLanguageForm').submit();
            });
        });

    }

    this.getCsrfTokenFromMeta = function() {
        const meta_csrf = document.querySelector('meta[name="csrf-token"]');
        return meta_csrf ? meta_csrf.getAttribute("content") : null;
    }

    this.initAjaxCsrfPreFilter = function() {
        $.ajaxPrefilter(function (options, _, jqXHR) {
            var token;
            if (!options.crossDomain) {
                token = $("meta[name='csrf-token']").attr("content");
                if (token) {
                    jqXHR.setRequestHeader("X-CSRF-Token", token);
                }
            }
        });

    }
};

JS_LIB_.geo_cookies = function() {

    let util;

    let geoObj = this;

    this.init = function() {

        util = new JS_LIB_.util();

        // Redirect automatico se webapp sbagliata
        geoObj.checkGeoRedirect();
        geoObj.countrySelectorListener();
        geoObj.showShippingCountryReminder();

    }

    this.countrySelectorListener = function(){

        // global: country selector (header)
        document.querySelectorAll('[data-shipping-country]').forEach(function(el) {
            el.addEventListener('click', function(e) {
                e.preventDefault();

                const geoId = this.dataset.shippingCountry;
                const currentWebapp = window.location.pathname.split("/")[1]; // "dp_it" o "dp_eu"
                const targetWebapp = util.mapCountryToWebapp(geoId);

                document.cookie = "shippingCountryGeoId=" + geoId + ";path=/;max-age=" + (60*60*24*30) + ";SameSite=Lax";

                if (targetWebapp && targetWebapp !== currentWebapp) {
                    // Cross-webapp: redirect diretto alla target webapp
                    // Passa il geoId come query param per aggiornare la sessione
                    window.location.href = "/" + targetWebapp + "/control/setShippingCountry?shippingCountryGeoId=" + geoId;
                } else {
                    // Stessa webapp: submit form per aggiornare la sessione
                    document.getElementById('shippingCountryGeoIdInput').value = geoId;
                    document.getElementById('chooseShippingCountryForm').submit();
                }

            });
        });
    }

    this.checkGeoRedirect = function(){

        var geoId = util.getCookie("shippingCountryGeoId");
        if (!geoId) return;

        var targetWebapp = util.mapCountryToWebapp(geoId);
        if (!targetWebapp) return;

        var currentWebapp = window.location.pathname.split("/")[1];

        if (currentWebapp !== targetWebapp) {
            var path = window.location.pathname.substring(("/" + currentWebapp).length);
            var query = window.location.search;
            window.location.href = "/" + targetWebapp + path + query;
        }

    }

    this.showShippingCountryReminder = function() {
        // Only show if user has never explicitly chosen a country
        // AND has never dismissed this popup
        var countryChosen = util.getCookie("shippingCountryGeoId");
        var popupDismissed = util.getCookie("__desphemmes_country_popup_dismissed");

        if (!countryChosen && !popupDismissed) {
            var modalEl = document.getElementById('shippingCountryReminderModal');
            if (modalEl) {
                // Show after a short delay (e.g., 1500ms) so the page loads first
                setTimeout(function() {
                    var modal = new bootstrap.Modal(modalEl);
                    modal.show();
                }, 1500);

                // When OK button is clicked, set dismissal cookie (30 days)
                var okBtn = document.getElementById('shippingCountryOkBtn');
                if (okBtn) {
                    okBtn.addEventListener('click', function() {
                        document.cookie = "__desphemmes_country_popup_dismissed=1;path=/;max-age=" + (60*60*24*30) + ";SameSite=Lax";
                    });
                }

                // When Change button is clicked, set dismissal cookie and scroll to header country selector
                var changeBtn = document.getElementById('shippingCountryChangeBtn');
                if (changeBtn) {
                    changeBtn.addEventListener('click', function() {
                        document.cookie = "__desphemmes_country_popup_dismissed=1;path=/;max-age=" + (60*60*24*30) + ";SameSite=Lax";
                        // Optionally highlight/scroll to the country selector in the header
                        var headerNav = document.querySelector('[data-shipping-country]');
                        if (headerNav) {
                            headerNav.closest('.menu-item').querySelector('.menu-link').click();
                        }
                    });
                }

                // Also dismiss if user closes modal via X button or clicking outside
                modalEl.addEventListener('hidden.bs.modal', function() {
                    document.cookie = "__desphemmes_country_popup_dismissed=1;path=/;max-age=" + (60*60*24*30) + ";SameSite=Lax";
                });
            }
        }
    }
}



/*
 * generic loader for all the pages => page controller
 *
 */

JS_LIB_.pageController = function() {

	this.init = function() {

		let util = new JS_LIB_.util();
		util.chooseLanguage();
        /* Required for ajax post request to add the csrf token automatically
        * in the header if the csrf strategy is enabled in ofbiz
        * Usually is enabled to correctly return form external payment gateway calls (keep the user logged in after the return)
        * and to protect from csrf attacks in ajax calls.
        * The csrf token is automatically generated by ofbiz and put in a meta tag in the head,
        * so this function read it and set it in the header of every ajax post call
        */
        util.initAjaxCsrfPreFilter();

		let geo = new JS_LIB_.geo_cookies();
		geo.init();

        let globalEvent = new JS_LIB_.event();
        globalEvent.miniCart();

		console.log('%c -----<>------------------ IF YOU ARE HERE  :)------MPSTYLE-------------<>----', consologstyleprimarymess);
		console.log('%c PAGE CONTROLLER INIT -----------------------', consologstyle);
		console.log('%c FRONT_CONTROLLER : ' + util.getPage(), consologstyle);

		/* page controller */

		switch (util.getPage()) {

			case 'faq':

                var faq = new JS_LIB_.faq();
                faq.init();

				break;

			case 'productdetail':

				var productDetail = new JS_LIB_.productDetail();
				productDetail.init();

				break;

            case 'categorydetail':

                var category = new JS_LIB_.categoryDetail();
                category.init();

                break;

            case 'showCart':

                var showCart = new JS_LIB_.showCart();
                showCart.init();

                break;

            case 'filterSearch':

                var filterSearch = new JS_LIB_.filterSearch();
                filterSearch.init();

            break;

            case 'newCustomer':

                var newCustomer = new JS_LIB_.newCustomer();
                newCustomer.init();

                break;

            case 'checkoutShippingAddress':

                var checkoutShippingAddress = new JS_LIB_.checkoutShippingAddress();
                checkoutShippingAddress.init();

                break;

            case 'checkoutShippingOptions':

                var checkoutShippingOptions = new JS_LIB_.checkoutShippingOptions();
                checkoutShippingOptions.init();

                break;


            case 'checkoutPayment':

                var checkoutPayment = new JS_LIB_.checkoutPayment();
                checkoutPayment.init();

                break;


            case 'editContactMech':

                var editContactMech = new JS_LIB_.editContactMech();
                editContactMech.init();

                break;

            case 'checkoutReview':

                var checkoutReview = new JS_LIB_.checkoutReview();
                checkoutReview.init();

                break;

		}

	};

};
