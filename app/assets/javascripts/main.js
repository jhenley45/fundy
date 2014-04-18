
var Fundy = Fundy || {};

$(document).ready(function() {
	Fundy.datepickerFormat();
	Fundy.addDateValidations();
	Fundy.formatRemainder();
	Fundy.addSidebar();
	Fundy.paymentStatus();
});

// Call masonry function AFTER all images have loaded
$(window).load(function() {
  Fundy.addMasonry();
});

$(window).resize(function(){
	var width = $(window).width(),
		sidebar = $('#main-gift-sidebar');
	if(width <= 900){
	  sidebar.hide();
	} else {
		sidebar.show();
	}
})
.resize();//trigger the resize event on page load.


Fundy.datepickerFormat = function() {
	$('#gift_end_date').datepicker({
        dateFormat: 'D, dd M yy'
    });
};

Fundy.addSidebar = function() {
	$('#main-feed-sidebar').affix({
    offset: {
      top: 100,
      bottom: function () {
        return (this.bottom = $('.footer').outerHeight(true))
      }
    }
  })
}

Fundy.addDateValidations = function() {
	$('#new-gift-form').submit(function() {
		user_date = new Date($('#gift_end_date').val());
		now = new Date($.now());
		if (user_date < now) {
			event.preventDefault();
			$('.form-errors').empty();
			Fundy.addDateError();
		};
	});
	$('.edit_gift').submit(function() {
		user_date = new Date($('#gift_end_date').val());
		now = new Date($.now());
		if (user_date < now) {
			event.preventDefault();
			$('.form-errors').empty();
			Fundy.addDateError();
		};
	});
};


Fundy.addDateError = function() {
	var error_field, message;
	error_field = $('.form-errors');
	message = $( "<p>Please select a date in the future</p>" );
	message.addClass('form-error');
	message.appendTo( error_field );
};

Fundy.formatRemainder = function() {
	var remainder_div, remainder;
	remainder_div = $('.gift-remainder');
	remainder = remainder_div.text()
	if (remainder < 0) {
		remainder_div.text('This campaign has surpassed its goal by: $' + Math.abs(remainder))
		remainder_div.children().addClass('negative-remainder')
	}
}

Fundy.addMasonry = function() {
	var $container = $('#main-gift-feed');
	$container.masonry({
	  itemSelector: '.single-gift'
	});
}

Fundy.paymentStatus = function() {
	$('.feed-status').each (function(index) {
		if (this.innerHTML.indexOf("Payment successfully processed") >= 0) {
			$(this).parents().eq(2).css({
				background: 'rgba(0, 255, 0, .1)'
			});
		};
	});
};
