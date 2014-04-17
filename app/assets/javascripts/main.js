
var Grifter = Grifter || {};

$(document).ready(function() {
	Grifter.datepickerFormat();
	Grifter.addDateValidations();
	Grifter.formatRemainder();
	Grifter.addSidebar();

});

// Call masonry function AFTER all images have loaded
$(window).load(function() {
  Grifter.addMasonry();
});

$(window).resize(function(){
	console.log('resize called');
	var width = $(window).width(),
		sidebar = $('#main-gift-sidebar');
	if(width <= 900){
	  sidebar.hide();
	} else {
		sidebar.show();
		console.log('show');
	}
})
.resize();//trigger the resize event on page load.


Grifter.datepickerFormat = function() {
	$('#gift_end_date').datepicker({
        dateFormat: 'D, dd M yy'
    });
};

Grifter.addSidebar = function() {
	$('#main-feed-sidebar').affix({
    offset: {
      top: 100,
      bottom: function () {
        return (this.bottom = $('.footer').outerHeight(true))
      }
    }
  })
}

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

Grifter.addMasonry = function() {
	var $container = $('#main-gift-feed');
	$container.masonry({
	  itemSelector: '.single-gift'
	});
}

