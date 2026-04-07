/*
 * Licensed to the Apache Software Foundation (ASF) under one
 * or more contributor license agreements.  See the NOTICE file
 * distributed with this work for additional information
 * regarding copyright ownership.  The ASF licenses this file
 * to you under the Apache License, Version 2.0 (the
 * "License"); you may not use this file except in compliance
 * with the License.  You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing,
 * software distributed under the License is distributed on an
 * "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 * KIND, either express or implied.  See the License for the
 * specific language governing permissions and limitations
 * under the License.
*/
package desphemmes.ecommerce.product

/*
 * This script is also referenced by the ecommerce's screens and
 * should not contain order component's specific code.
 */

import freemarker.template.SimpleHash
import freemarker.template.DefaultObjectWrapperBuilder
import freemarker.template.Configuration
import org.apache.ofbiz.base.util.Debug

def wrapper = new DefaultObjectWrapperBuilder(Configuration.VERSION_2_3_31).build()

import org.apache.ofbiz.base.util.UtilMisc
import org.apache.ofbiz.base.util.UtilProperties
import org.apache.ofbiz.entity.GenericValue
import org.apache.ofbiz.entity.util.EntityQuery
import org.apache.ofbiz.entity.util.EntityUtilProperties
import org.apache.ofbiz.product.product.ProductContentWrapper
import org.apache.ofbiz.product.config.ProductConfigWorker
import org.apache.ofbiz.product.catalog.CatalogWorker
import org.apache.ofbiz.product.store.ProductStoreWorker
import org.apache.ofbiz.order.shoppingcart.ShoppingCartEvents
import org.apache.ofbiz.product.product.ProductWorker
import org.apache.ofbiz.service.LocalDispatcher
import org.apache.ofbiz.webapp.website.WebSiteWorker
import java.text.NumberFormat

//either optProduct, optProductId or productId must be specified
product = request.getAttribute('optProduct')
optProductId = request.getAttribute('optProductId')
productId = product?.productId ?: optProductId ?: request.getAttribute('productId')

String tenantId = delegator.getDelegatorTenantId().toLowerCase();
String blankSku = EntityUtilProperties.getPropertyValue(tenantId,"blankSkuImage",delegator);
String blankCrop = EntityUtilProperties.getPropertyValue(tenantId,"blankCropImage",delegator);

webSiteId = WebSiteWorker.getWebSiteId(request)
catalogId = CatalogWorker.getCurrentCatalogId(request)
cart = ShoppingCartEvents.getCartObject(request)
productStore = null
productStoreId = null
facilityId = null
if (cart.isSalesOrder()) {
    productStore = ProductStoreWorker.getProductStore(request)
    productStoreId = productStore.productStoreId
    context.productStoreId = productStoreId
    facilityId = productStore.inventoryFacilityId
}

if (!facilityId) {
    productStoreFacility = select('facilityId').from('ProductStoreFacility').where('productStoreId', productStoreId).queryFirst()
    if (productStoreFacility) {
        facilityId = productStoreFacility.facilityId
    }
}

autoUserLogin = session.getAttribute('autoUserLogin')
userLogin = session.getAttribute('userLogin')

context.remove('daysToShip')
context.remove('averageRating')
context.remove('numRatings')
context.remove('totalPrice')

// get the product entity
if (!product && productId) {
    product = from('Product').where('productId', productId).cache(true).queryOne()
}
if (product) {
    //if order is purchase then don't calculate available inventory for product.
    if (cart.isSalesOrder()) {
        resultOutput = runService('getInventoryAvailableByFacility', [productId: product.productId, facilityId: facilityId, useCache: true])
        totalAvailableToPromise = resultOutput.availableToPromiseTotal
        if (totalAvailableToPromise && totalAvailableToPromise.doubleValue() > 0) {
            productFacility = from('ProductFacility').where('productId', product.productId, 'facilityId', facilityId).cache(true).queryOne()
            if (productFacility?.daysToShip != null) {
                context.daysToShip = productFacility.daysToShip
            }
        }
    } else {
        supplierProduct = from('SupplierProduct').where('productId', product.productId).orderBy('-availableFromDate').cache(true).queryFirst()
        if (supplierProduct?.standardLeadTimeDays != null) {
            standardLeadTimeDays = supplierProduct.standardLeadTimeDays
            daysToShip = standardLeadTimeDays + 1
            context.daysToShip = daysToShip
        }
    }
    // make the productContentWrapper
    productContentWrapper = new ProductContentWrapper(product, request)
    context.productContentWrapper = productContentWrapper

    String largeImageUrl = productContentWrapper.get("LARGE_IMAGE_URL", "html")
    String productAdditionalImage2 = productContentWrapper.get("ADDITIONAL_IMAGE_2", "html")
    String productAdditionalImage3 = productContentWrapper.get("ADDITIONAL_IMAGE_3", "html")
    String productAdditionalImage4 = productContentWrapper.get("ADDITIONAL_IMAGE_4", "html")

    context.largeImageUrl = largeImageUrl;
    context.productAdditionalImage2 = productAdditionalImage2;
    context.productAdditionalImage3 = productAdditionalImage3;
    context.productAdditionalImage4 = productAdditionalImage4;
    context.blankSku = blankSku;
    context.blankCrop = blankCrop;

}

categoryId = null
reviews = null
if (product) {
    numberFormat = NumberFormat.getCurrencyInstance(locale)
    categoryId = parameters.category_id ?: request.getAttribute('productCategoryId')

    variantInfoJS = new StringBuffer()
    variantInfoJS.append('<script language="JavaScript" type="text/javascript">\n    jQuery(document).ready(function(jQuery) {\n')

    // get the product price
    if (cart.isSalesOrder()) {
        // sales order: run the "calculateProductPrice" service
        priceContext = [product: product, currencyUomId: cart.getCurrency(),
                        autoUserLogin: autoUserLogin, userLogin: userLogin]
        priceContext.webSiteId = webSiteId
        priceContext.prodCatalogId = catalogId
        priceContext.productStoreId = productStoreId
        priceContext.agreementId = cart.getAgreementId()
        priceContext.partyId = cart.getPartyId() // IMPORTANT: otherwise it'll be calculating prices using
                                                 // the logged in user which could be a CSR instead of the customer
        priceContext.checkIncludeVat = 'Y'
        priceMap = runService('calculateProductPrice', priceContext)

        context.price = priceMap
    } else {
        // purchase order: run the "calculatePurchasePrice" service
        priceContext = [product: product, currencyUomId: cart.getCurrency(),
                        partyId: cart.getPartyId(), userLogin: userLogin]
        priceMap = runService('calculatePurchasePrice', priceContext)

        context.price = priceMap
    }

    // get aggregated product totalPrice
    if (product.productTypeId == 'AGGREGATED' || product.productTypeId == 'AGGREGATED_SERVICE') {
        configWrapper = ProductConfigWorker.getProductConfigWrapper(productId, cart.getCurrency(), request)
        if (configWrapper) {
            configWrapper.setDefaultConfig()
            context.totalPrice = configWrapper.getTotalPrice()
        }
    }

    //println "price ${priceMap}"

    // get the product review(s)
    reviews = product.getRelated('ProductReview', null, ['-postedDateTime'], true)

    // get product variant for Box/Case/Each
    productVariants = []
    boolean isAlternativePacking = ProductWorker.isAlternativePacking(delegator, product.productId, null)
    mainProducts = []
    if (isAlternativePacking) {
        productVirtualVariants = from('ProductAssoc')
                .where('productIdTo', product.productId , 'productAssocTypeId', 'ALTERNATIVE_PACKAGE').cache(true).queryList()
        if (productVirtualVariants) {
            productVirtualVariants.each { virtualVariantKey ->
                mainProductMap = [:]
                mainProduct = virtualVariantKey.getRelatedOne('MainProduct', true)
                quantityUom = mainProduct.getRelatedOne('QuantityUom', true)
                mainProductMap.productId = mainProduct.productId
                mainProductMap.piecesIncluded = mainProduct.piecesIncluded
                mainProductMap.uomDesc = quantityUom.description
                mainProducts.add(mainProductMap)
            }
        }

        // get alternative product price when product doesn't have any feature
        jsBuf = new StringBuffer()
        jsBuf.append('<script type="application/javascript">')

        // make a list of variant sku with requireAmount
        virtualVariantsRes = runService('getAssociatedProducts',
                [productIdTo: productId, type: 'ALTERNATIVE_PACKAGE', checkViewAllow: true, prodCatalogId: categoryId])
        virtualVariants = virtualVariantsRes.assocProducts

        //println "virtualVariants ${virtualVariants}"

        // Format to apply the currency code to the variant price in the javascript
        if (productStore) {
            localeString = productStore.defaultLocaleString
            if (localeString) {
                locale = UtilMisc.parseLocale(localeString)
            }
        }
        variantPriceList = []

        if (virtualVariants) {
            amt = new StringBuffer()
            // Create the javascript to return the price for each variant
            variantPriceJS = new StringBuffer()
            variantPriceJS.append('function getVariantPrice(sku) { ')

            virtualVariants.each { virtualAssoc ->
                virtual = virtualAssoc.getRelatedOne('MainProduct', false)
                // Get price from a virtual product
                priceContext.product = virtual
                if (cart.isSalesOrder()) {
                    // sales order: run the "calculateProductPrice" service
                    virtualPriceMap = runService('calculateProductPrice', priceContext)
                    // Get the minimum quantity for variants if MINIMUM_ORDER_PRICE is set for variants.
                    variantPriceList.add(virtualPriceMap)
                } else {
                    virtualPriceMap = runService('calculatePurchasePrice', priceContext)
                }
                if (virtualPriceMap.price) {
                    price = numberFormat.format(virtualPriceMap.price)
                } else {
                    price = UtilProperties.getResourceBundleMap('CommonUiLabels', locale).get('CommonNA')
                }
                variantPriceJS.append('  if (sku == "' + virtual.productId + '") return "' + price + '"; ')
                variantInfoJS.append("        variantPrices['" + virtual.productId + "'] = '" + price + "';\n")
            }
            variantPriceJS.append(' } ')

            context.variantPriceList = variantPriceList
            jsBuf.append(amt.toString())
            jsBuf.append(variantPriceJS.toString())
            jsBuf.append('</script>')
            context.virtualJavaScript = jsBuf
        }
    }
    variantInfoJS.append("        variantPrices['" + product.productId + "'] = '" + numberFormat.format(priceMap.price) + "';\n")
    variantInfoJS.append('    });\n</script>\n')
    context.variantInfoJavaScript = variantInfoJS

    //println "variantInfoJS ${variantInfoJS}"


    context.mainProducts = mainProducts
}

// get the average rating
if (reviews) {
    totalProductRating = 0
    numRatings = 0
    reviews.each { productReview ->
        productRating = productReview.productRating
        if (productRating) {
            totalProductRating += productRating
            numRatings++
        }
    }
    if (numRatings) {
        context.averageRating = totalProductRating / numRatings
        context.numRatings = numRatings
    }
}

// an example of getting features of a certain type to show
sizeProductFeatureAndAppls = from('ProductFeatureAndAppl')
        .where('productId', productId, 'productFeatureTypeId', 'SIZE')
        .orderBy( 'defaultSequenceNum')
        .cache(true)
        .queryList()

//println "sizeProductFeatureAndAppls ${sizeProductFeatureAndAppls}"

colorProductFeature = from('ProductFeatureAndAppl')
        .where('productId', productId, 'productFeatureTypeId', 'COLOR')
        .orderBy('sequenceNum', 'defaultSequenceNum')
        .cache(true)
        .queryFirst()

cropColor = productContentWrapper.get('ADDITIONAL_IMAGE_1', 'html');

variantIds =  from('ProductAssoc')
        .where('productId', productId, 'productAssocTypeId', 'PRODUCT_VARIANT')
        .cache(true)
        .orderBy('sequenceNum')
        .getFieldList("productIdTo");

//println "variantIds ${variantIds}"


colorVariantIds =  from('ProductAssoc')
        .where('productId', productId, 'productAssocTypeId', 'PRODUCT_UPGRADE')
        .cache(true)
        .queryList();

def totalColorMap = new LinkedHashMap<>()

def parentMap = new LinkedHashMap<>()
parentMap.put("productId", productId)
parentMap.put("image", cropColor)

totalColorMap.put(
        colorProductFeature.getString("description"),
        parentMap
)

for (GenericValue colorProduct : colorVariantIds) {

    //println "colorProduct ${colorProduct}"

    productIdTo = colorProduct.getRelatedOne("AssocProduct",false);

    colorProductId = colorProduct.getString("productIdTo");

    colorMap = new LinkedHashMap<>()

    GenericValue colorFeature = EntityQuery.use(delegator)
            .from("ProductFeatureAndAppl")
            .where("productId", colorProductId,
                    "productFeatureTypeId", "COLOR")
            .queryFirst();

    variantProductContentWrapper = ProductContentWrapper.makeProductContentWrapper(productIdTo, request)

    String colorFeatureImage = variantProductContentWrapper.get('ADDITIONAL_IMAGE_1', 'html');

    colorMap.put("productId",colorProductId);
    colorMap.put("image",colorFeatureImage);

    totalColorMap.putIfAbsent(colorFeature.getString("description"),colorMap);

}


def sizeMap = new LinkedHashMap<String, String>();

def unavailableSizeMap = new HashMap<String, String>();

for(GenericValue sizes : sizeProductFeatureAndAppls) {

    sizeMap.put(sizes.getString("productFeatureId"), "");

}

for (String variantId : variantIds) {

    //println "variantId ${variantId}"

    GenericValue feature = EntityQuery.use(delegator)
            .from("ProductFeatureAndAppl")
            .where("productId", variantId, "productFeatureTypeId", "SIZE")
            .orderBy( 'defaultSequenceNum')
            .filterByDate()
            .queryFirst()

    String size  = feature?.getString("description");


    boolean available = checkInventory(dispatcher, variantId, productStoreId);

    sizeMap.put(size, variantId);

    if (!available) {
        unavailableSizeMap.put(size, variantId);
    }

}


private static boolean checkInventory(LocalDispatcher dispatcher, String productId, String productStoreId) {
    try {
        Map<String, Object> ctx = UtilMisc.toMap("productId", productId, "productStoreId", productStoreId, "quantity", new BigDecimal("1"));
        Map<String, Object> result = dispatcher.runSync("isStoreInventoryAvailable", ctx);
        boolean available = "Y".equals(result.get("available"));
        Debug.logInfo("Inventory check for " + productId + ": " + available, "ProductSummary");
        return available;
    } catch (Exception e) {
        Debug.logError(e, "Inventory check failed");
        return false;
    }
}



context.product = product
context.categoryId = categoryId
context.productReviews = reviews
context.sizeProductFeatureAndAppls = sizeProductFeatureAndAppls
context.myColors = new SimpleHash(totalColorMap, wrapper)
context.mySizes = new SimpleHash(sizeMap, wrapper)
context.unavailableSizeMap = new SimpleHash(unavailableSizeMap,wrapper)