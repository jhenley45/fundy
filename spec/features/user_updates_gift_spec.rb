require 'spec_helper'

feature 'User Signs In' do

	context 'when signed in' do
		background do
			@user = create(:user)
			visit root_path
			sign_in_as(@user)
			add_new_gift
		end

		scenario 'Updates a gift successfully' do
			click_on 'Update this campaign'
			fill_in 'Title for campaign', with: 'Old computer for Steve'
			fill_in 'Description of gift:', with: 'Old macbook pro'
			fill_in 'Reason for gift:', with: 'Steves birthday is coming up. Lets get him an old computer!'
			fill_in 'Campaign duration:', with: '30'
			fill_in 'Campaign goal:', with: '1,600'
			click_on 'Update campaign!'
			expect(page).to have_content('Your campaign \'Old computer for Steve\' has been successfully updated.')
		end

	end
end
