require 'spec_helper'

feature 'User Signs In' do

	context 'when signed in', :js do
		background do
			@user = create(:user)
			visit root_path
			sign_in_as(@user)
		end

		scenario 'Adds a new gift successfully' do
			click_on 'Create New Gift Campaign'
			fill_in 'Title for campaign', with: 'New computer for Steve'
			fill_in 'Description of gift:', with: 'New macbook pro'
			fill_in 'Reason for gift:', with: 'Steves birthday is coming up. Lets get him a new computer!'
			fill_in 'Campaign duration:', with: '30'
			fill_in 'Campaign goal:', with: '1,500'
			click_on 'Create campaign!'
			expect(page).to have_content 'New computer for Steve'
		end

		scenario 'Tries to unsuccessfully add a new gift without a name' do
			click_on 'Create New Gift Campaign'

			fill_in 'Description of gift:', with: 'New macbook pro'
			fill_in 'Reason for gift:', with: 'Steves birthday is coming up. Lets get him a new computer!'
			fill_in 'Campaign duration:', with: '30'
			fill_in 'Campaign goal:', with: '1,500'
			click_on 'Create campaign!'
			expect(page).to have_content 'This field is required'
		end

		scenario 'Tries to unsuccessfully add a new gift without an end date' do
			click_on 'Create New Gift Campaign'

			fill_in 'Title for campaign', with: 'New computer for Steve'
			fill_in 'Description of gift:', with: 'New macbook pro'
			fill_in 'Reason for gift:', with: 'Steves birthday is coming up. Lets get him a new computer!'
			fill_in 'Campaign goal:', with: '1,500'
			click_on 'Create campaign!'
			expect(page).to have_content 'This field is required'
		end

		scenario 'Tries to unsuccessfully add a new gift without a campaign goal' do
			click_on 'Create New Gift Campaign'

			fill_in 'Title for campaign', with: 'New computer for Steve'
			fill_in 'Description of gift:', with: 'New macbook pro'
			fill_in 'Reason for gift:', with: 'Steves birthday is coming up. Lets get him a new computer!'
			fill_in 'Campaign duration:', with: '30'
			click_on 'Create campaign!'
			expect(page).to have_content 'This field is required'
		end

	end
end
