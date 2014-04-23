module VenmoAccountsHelper
	def full_name
		@venmo_account.first_name + ' ' + @venmo_account.last_name
	end
	def first_name
		@venmo_account.first_name
	end
	def recent_activity
		pledges = @venmo_account.user.pledges.where(owner:false)
		gifts = @venmo_account.user.gifts
		activity = pledges + gifts
		activity.sort_by(&:updated_at).reverse
	end


end
