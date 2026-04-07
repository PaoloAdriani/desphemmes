<#macro renderMessages>

    <#-- Merge OFBiz message sources -->
    <#assign errorList = (_ERROR_MESSAGE_LIST_!errorMessageList)![]>
    <#assign successList = (_EVENT_MESSAGE_LIST_)![]>
    <#assign infoMessage = (_INFO_MESSAGE_)!>
    <#assign errorMessageSingle = (_ERROR_MESSAGE_!errorMessage)!>
    <#assign successMessageSingle = (_EVENT_MESSAGE_)!>
    <#assign warningMessage = (_WARNING_MESSAGE_)!>
    <#assign warningMessageList = (_WARNING_MESSAGE_LIST_!warningMessageList)![]>




    <#-- ERROR LIST -->
    <#if errorList?has_content>
        <div class="alert alert-danger alert-dismissible fade show ofbiz-alert" role="alert">

            <div class="d-flex align-items-start">

                <div class="me-2">
                    <i class="fa-solid fa-circle-exclamation"></i>
                </div>

                <div class="flex-grow-1">
                    <ul class="mb-0">
                        <#list errorList as msg>
                            <li>${msg}</li>
                        </#list>
                    </ul>
                </div>

                <button type="button"
                        class="btn-close ms-3"
                        data-bs-dismiss="alert"
                        aria-label="Close">
                </button>

            </div>

        </div>
    </#if>


    <#-- SINGLE ERROR -->
    <#if errorMessageSingle?has_content>
        <div class="alert alert-danger alert-dismissible fade show ofbiz-alert" role="alert">

            <div class="d-flex align-items-center">

                <i class="fa-solid fa-circle-exclamation me-2"></i>

                <div class="flex-grow-1">
                    ${errorMessageSingle}
                </div>

                <button type="button"
                        class="btn-close"
                        data-bs-dismiss="alert">
                </button>

            </div>

        </div>
    </#if>


    <#-- SUCCESS LIST -->
    <#if successList?has_content>
        <div class="alert alert-success alert-dismissible fade show ofbiz-alert" role="alert">

            <div class="d-flex align-items-start">

                <i class="fa-solid fa-circle-check me-2"></i>

                <div class="flex-grow-1">
                    <ul class="mb-0">
                        <#list successList as msg>
                            <li>${msg}</li>
                        </#list>
                    </ul>
                </div>

                <button type="button"
                        class="btn-close"
                        data-bs-dismiss="alert">
                </button>

            </div>

        </div>
    </#if>


    <#-- SINGLE SUCCESS -->
    <#if successMessageSingle?has_content>
        <div class="alert alert-success alert-dismissible fade show ofbiz-alert" role="alert">

            <i class="fa-solid fa-circle-check me-2"></i>

            ${successMessageSingle}

            <button type="button"
                    class="btn-close"
                    data-bs-dismiss="alert">
            </button>

        </div>
    </#if>


    <#-- INFO -->
    <#if infoMessage?has_content>
        <div class="alert alert-info alert-dismissible fade show ofbiz-alert" role="alert">

            <i class="fa-solid fa-circle-info me-2"></i>

            ${infoMessage}

            <button type="button"
                    class="btn-close"
                    data-bs-dismiss="alert">
            </button>

        </div>
    </#if>

    <#-- INFO -->
        <#if warningMessage?has_content>
            <div class="alert alert-info alert-dismissible fade show ofbiz-alert" role="alert">

                <i class="fa-solid fa-circle-info me-2"></i>

                ${warningMessage}

                <button type="button"
                        class="btn-close"
                        data-bs-dismiss="alert">
                </button>

            </div>
        </#if>

</#macro>