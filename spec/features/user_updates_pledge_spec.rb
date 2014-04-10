require 'spec_helper'

feature 'User Signs In' do

	context 'when signed in', :js do
		background do
			pledge = create(:pledge)
			pledge.user.create_venmo_account(first_name: 'Jack', last_name: 'Hanley')
			visit root_path
			sign_in_as(pledge.user)
			click_on 'test gift'
		end

		scenario 'Updates a pledge successfully' do
			click_on 'Make a Pledge'
			fill_in 'Your pledge amount:', with: '10.55'
			click_on 'Make Pledge!'
			click_on 'Update pledge'
			fill_in 'New pledge amount:', with: '11.55'
			click_on 'Update Pledge!'
			expect(page).to have_content('Your updated pledge of $11.55 to \'test gift\' has been successfully recorded!')
		end

		scenario 'Updates a pledge successfully' do
			click_on 'Make a Pledge'
			fill_in 'Your pledge amount:', with: '10.55'
			click_on 'Make Pledge!'
			click_on 'Update pledge'
			fill_in 'New pledge amount:', with: ''
			click_on 'Update Pledge!'
			expect(page).to have_content('Amount can\'t be blank')
		end

		scenario 'Tries to update a pledge with $0' do
			click_on 'Make a Pledge'
			fill_in 'Your pledge amount:', with: '10.55'
			click_on 'Make Pledge!'
			click_on 'Update pledge'
			fill_in 'New pledge amount:', with: '0'
			click_on 'Update Pledge!'
			expect(page).to have_content('Amount must be greater than 0')
		end
	end
end
