
var Grifter = Grifter || {};

$(document).ready(function() {
	Grifter.datepickerFormat();
	Grifter.addDateValidations();
	Grifter.formatRemainder();
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
			$('.form-errors').empty();
			Grifter.addDateError();
		};
	});
	$('.edit_gift').submit(function() {
		user_date = new Date($('#gift_end_date').val());
		now = new Date($.now());
		if (user_date < now) {
			event.preventDefault();
			$('.form-errors').empty();
			Grifter.addDateError();
		};
	});
};


Grifter.addDateError = function() {
	var error_field, message;
	error_field = $('.form-errors');
	message = $( "<p>Please select a date in the future</p>" );
	message.addClass('form-error');
	message.appendTo( error_field );
};

Grifter.formatRemainder = function() {
	var remainder_div, remainder;
	remainder_div = $('.gift-remainder');
	remainder = remainder_div.text()
	if (remainder < 0) {
		remainder_div.text('This campaign has surpassed its goal by: $' + Math.abs(remainder))
		remainder_div.children().addClass('negative-remainder')
	}
}



