module SessionHelpers
	def sign_in_as(user)
		visit root_path
		click_on 'User Login'
		fill_in 'Email', with: user.email
		fill_in 'Password', with: user.password
		click_button 'Sign in'
	end

	def add_new_gift
		visit root_path
		click_on 'Create New Gift Campaign'
		fill_in 'Title for campaign', with: 'New computer for Steve'
		fill_in 'Description of gift:', with: 'New macbook pro'
		fill_in 'Reason for gift:', with: 'Steves birthday is coming up. Lets get him a new computer!'
		fill_in 'Campaign duration:', with: '30'
		fill_in 'Campaign goal:', with: '1,500'
		click_on 'Create campaign!'

	end
end
