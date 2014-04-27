module InvitationsHelper
	def full_name
		venmo_account.first_name + ' ' + venmo_account.last_name
	end
end
