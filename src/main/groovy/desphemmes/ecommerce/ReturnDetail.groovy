package desphemmes.ecommerce;

import org.apache.ofbiz.entity.condition.EntityCondition
import org.apache.ofbiz.entity.condition.EntityOperator

def delegator = request.getAttribute("delegator")
def userLogin = request.getAttribute("userLogin")

def returnHeaders = delegator.findList(
        "ReturnHeader",
        EntityCondition.makeCondition("fromPartyId", userLogin.partyId),
        null,
        ["-entryDate"],
        null,
        false
)

def returnList = []

returnHeaders.each { header ->

    def items = delegator.findList(
            "ReturnItem",
            EntityCondition.makeCondition("returnId", header.returnId),
            null,
            null,
            null,
            false
    )

    returnList << [
            header: header,
            items : items
    ]
}

context.returnList = returnList