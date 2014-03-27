require 'spec_helper'

feature 'User Signs In' do

	context 'when signed in', :js do
		background do
			pledge = create(:pledge)
			pledge.user.create_venmo_account()
			visit root_path
			sign_in_as(pledge.user)
			click_on 'test gift'
		end

		scenario 'Updates a pledge successfully' do
			click_on 'Make a pledge to this campaign'
			fill_in 'Your pledge amount:', with: '10.55'
			click_on 'Make Pledge!'
			click_on 'Update this pledge'
			fill_in 'New pledge amount:', with: '11.55'
			click_on 'Update Pledge!'
			expect(page).to have_content('Your pledge of $11.55 to \'test gift\' has been successfully updated!')
		end

		scenario 'Updates a pledge successfully' do
			click_on 'Make a pledge to this campaign'
			fill_in 'Your pledge amount:', with: '10.55'
			click_on 'Make Pledge!'
			click_on 'Update this pledge'
			fill_in 'New pledge amount:', with: ''
			click_on 'Update Pledge!'
			expect(page).to have_content('Amount can\'t be blank')
		end

	end
end
