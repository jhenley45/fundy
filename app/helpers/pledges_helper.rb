module PledgesHelper

	# Returns full name for the owner of a pledge
	def pledge_owner_full_name(user_id)
	  user = User.find(user_id)
	  user.venmo_account.first_name + ' ' + user.venmo_account.last_name
	end

end
