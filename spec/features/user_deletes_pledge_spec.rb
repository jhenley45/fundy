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

		scenario 'Deletes a pledge successfully' do
			click_on 'Make a Pledge'
			fill_in 'Your pledge amount:', with: '10.55'
			click_on 'Make Pledge!'
			click_on 'Delete this pledge'
			expect(page).to have_content('Your pledge of $10.55 to \'test gift\' has been successfully deleted!')
		end

	end
end
