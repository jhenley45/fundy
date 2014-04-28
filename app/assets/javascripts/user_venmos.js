var Fundy = Fundy || {};

$(document).ready(function() {
	Fundy.addUserGiftSortClick();
});

Fundy.userCampaignSort = function(data_type) {
	$('#user-gifts').children('li').hide();
	$("li[data-" + data_type + "='true']").show();
};

Fundy.addUserGiftSortClick = function() {
	$('.user-gift-sort').each(function() {
		$(this).click(function() {
			Fundy.userCampaignSort(this.id)
		});
	});
};


