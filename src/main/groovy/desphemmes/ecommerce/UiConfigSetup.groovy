/*
 * UI decorator to load some shared UI configuration variables, like the path to the assets,
 *  which is used in the header and footer of the storefront.
 *
*/
package desphemmes.ecommerce

import org.apache.ofbiz.entity.util.EntityUtilProperties


logInfo("Setting up UI configuration for Desp Hemmes E-commerce plugin")
def MPSTYLEUI_RESOURCE_ID = "mpstyleui"
def assetspath = EntityUtilProperties.getPropertyValue(MPSTYLEUI_RESOURCE_ID, "ui.assetsPath","/dp_it/assets", delegator)

globalContext.assetspath = assetspath