package desphemmes.ecommerce

import org.apache.ofbiz.entity.condition.EntityCondition
import org.apache.ofbiz.entity.util.EntityUtil
import org.apache.ofbiz.base.util.UtilMisc
import org.apache.ofbiz.product.store.ProductStoreWorker
import org.apache.ofbiz.product.category.CategoryContentWrapper

def productStore = ProductStoreWorker.getProductStore(request)
def productStoreId = productStore?.productStoreId

def navCategories = []

if (productStoreId) {

    def productStoreCatalog = EntityUtil.getFirst(
            delegator.findByAnd("ProductStoreCatalog",
                    UtilMisc.toMap("productStoreId", productStoreId),
                    null, false)
    )

    if (productStoreCatalog) {

        def prodCatalogId = productStoreCatalog.prodCatalogId

        def catalogCategories = EntityUtil.filterByDate(
                delegator.findByAnd("ProdCatalogCategory",
                        UtilMisc.toMap("prodCatalogId", prodCatalogId),
                        UtilMisc.toList("sequenceNum"), false)
        )

        catalogCategories.each { cat ->

            def parentCategory = delegator.findOne("ProductCategory",
                    UtilMisc.toMap("productCategoryId", cat.productCategoryId), false)

            if (!parentCategory) return

            def parentWrapper = CategoryContentWrapper.makeCategoryContentWrapper(parentCategory, request)
            def parentName = parentWrapper.get("CATEGORY_NAME","html")

            def children = []

            def rollups = EntityUtil.filterByDate(
                    delegator.findByAnd("ProductCategoryRollupAndChild",
                            UtilMisc.toMap(
                                    "parentProductCategoryId", cat.productCategoryId,
                                    "productCategoryTypeId", "CATALOG_CATEGORY"
                            ),
                            UtilMisc.toList("sequenceNum"), false)
            )

            rollups.each { r ->

                def childCategory = delegator.findOne("ProductCategory",
                        UtilMisc.toMap("productCategoryId", r.productCategoryId), false)

                if (!childCategory) return

                def childWrapper = CategoryContentWrapper.makeCategoryContentWrapper(childCategory, request)

                children.add([
                        id  : r.productCategoryId,
                        name: childWrapper.get("CATEGORY_NAME","html")
                ])
            }

            navCategories.add([
                    id      : cat.productCategoryId,
                    name    : parentName,
                    children: children
            ])
        }
    }
}

//println "navCategories ${navCategories}"

context.navCategories = navCategories

