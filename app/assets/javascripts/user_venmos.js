var Fundy = Fundy || {};

$(document).ready(function() {
	Fundy.addUserGiftSortClick();
});

Fundy.userCampaignSort = function(data_type) {
	$('.user-gift-sort').css("font-weight", 'normal')
	$('#' + event.target.id).css("font-weight", 'bold')
	$('.user-sidebar-gift').hide();
	$("div[data-" + data_type + "='true']").show();
};

Fundy.addUserGiftSortClick = function() {
	$('.user-gift-sort').each(function() {
		$(this).click(function() {
			Fundy.userCampaignSort(this.id)
		});
	});
};


