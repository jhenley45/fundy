$(document).ready(function () {
	$('#new_gift').validate({
	//debug: true,
	rules: {
	'gift[name]': {required: true},
	'gift[end_date]': {required: true},
	'gift[goal]': {required: true}
	}
	});
});
