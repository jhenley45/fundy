require 'spec_helper'

feature 'User Signs In' do

	context 'when signed in', :js do
		background do
			@user = create(:user)
			visit root_path
			sign_in_as(@user)
			add_new_gift
		end

		scenario 'Adds a pledge successfully' do
			click_on 'Make a pledge to this campaign'
			fill_in 'Your pledge amount:', with: '10.55'
			click_on 'Make Pledge!'
			expect(page).to have_content('Your pledge of $10.55 to \'New computer for Steve\' has been successfully recorded!')
		end

	end
end
