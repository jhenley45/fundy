
var Grifter = Grifter || {};

$(document).ready(function() {
	Grifter.datepickerFormat();
	Grifter.addDateValidations();

})

Grifter.datepickerFormat = function() {
	$('#gift_end_date').datepicker({
        dateFormat: 'D, dd M yy'
    });
};

Grifter.addDateValidations = function() {
	$('#new-gift-form').submit(function() {
		user_date = new Date($('#gift_end_date').val());
		now = new Date($.now());
		if (user_date < now) {
			event.preventDefault();
			$('#new-form-errors').empty();
			Grifter.addDateError();
		};
	})
};

Grifter.addDateError = function() {
	var error_field, message;
	error_field = $('#new-form-errors');
	message = $( "<p>Please select a date in the future</p>" );
	message.addClass('form-error');
	message.appendTo( error_field );
};





