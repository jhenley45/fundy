// $(document).ready(function () {
// 	Grifter.addFormValidations();
// });

// var Grifter = Grifter || {};

// Grifter.addFormValidations = function() {
// 	$('#new_gift').validate({
// 		rules: {
// 		'gift[name]': {required: true},
// 		'gift[end_date]': {required: true},
// 		'gift[goal]': {required: true}
// 		}
// 	});
// 	$('.edit_gift').validate({
// 		rules: {
// 		'gift[name]': {required: true},
// 		'gift[end_date]': {required: true},
// 		'gift[goal]': {required: true}
// 		}
// 	});
// }
$(document).ready(function() {
	$('#gift_end_date').datepicker({
        dateFormat: 'D, dd M yy'
    });

})
