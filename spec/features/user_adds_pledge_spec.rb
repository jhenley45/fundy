require 'spec_helper'

feature 'User Signs In' do

	context 'when signed in', :js do
		background do
			pledge = create(:pledge)
			visit root_path
			sign_in_as(pledge.user)
			click_on 'test gift'
		end

		scenario 'Adds a pledge successfully' do
			click_on 'Make a pledge to this campaign'
			fill_in 'Your pledge amount:', with: '10.55'
			click_on 'Make Pledge!'
			expect(page).to have_content('Your pledge of $10.55 to \'test gift\' has been successfully recorded!')
		end

		scenario 'Adds a pledge unsuccessfully' do
			click_on 'Make a pledge to this campaign'
			fill_in 'Your pledge amount:', with: ''
			click_on 'Make Pledge!'
			expect(page).to have_content('Amount can\'t be blank')
		end

	end
end
