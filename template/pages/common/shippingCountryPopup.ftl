<!-- Shipping Country Reminder Modal -->
<div class="modal fade" id="shippingCountryReminderModal" tabindex="-1" aria-labelledby="shippingCountryReminderLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="shippingCountryReminderLabel">
                    <i class="bi-truck"></i>&nbsp; ${SystemLabelMap.ShippingCountryReminderTitle}
                </h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <p>${SystemLabelMap.ShippingCountryReminderMessage}</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-outline-secondary upper" id="shippingCountryChangeBtn" data-bs-dismiss="modal">
                    ${SystemLabelMap.ShippingCountryReminderChange}
                </button>
                <button type="button" class="btn btn-dark upper" id="shippingCountryOkBtn" data-bs-dismiss="modal">
                    ${SystemLabelMap.ShippingCountryReminderOk}
                </button>
            </div>
        </div>
    </div>
</div>