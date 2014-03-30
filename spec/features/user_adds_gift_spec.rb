require 'spec_helper'

feature 'User Signs In' do

	context 'when signed in', :js do
		background do
			@user = create(:user)
			@user.create_venmo_account()
			visit root_path
			sign_in_as(@user)
		end

		scenario 'Adds a new gift successfully' do
			click_on 'Create New Gift Campaign'
			fill_in 'Title for campaign', with: 'New computer for Steve'
			fill_in 'Description of gift:', with: 'New macbook pro'
			fill_in 'Reason for gift:', with: 'Steves birthday is coming up. Lets get him a new computer!'
			fill_in 'Campaign end date:', with: 'Fri, 30 May 2014'
			fill_in 'Campaign goal:', with: 1500
			find('#new-campaign-submit').trigger('click')
			expect(page).to have_content 'New computer for Steve'
		end

		scenario 'Tries to unsuccessfully add a new gift without a name' do
			click_on 'Create New Gift Campaign'

			fill_in 'Description of gift:', with: 'New macbook pro'
			fill_in 'Reason for gift:', with: 'Steves birthday is coming up. Lets get him a new computer!'
			fill_in 'Campaign end date:', with: 'Fri, 30 May 2014'
			fill_in 'Campaign goal:', with: 1500
			find('#new-campaign-submit').trigger('click')
			expect(page).to have_content 'Name can\'t be blank'
		end

		scenario 'Tries to unsuccessfully add a new gift without an end date' do
			click_on 'Create New Gift Campaign'

			fill_in 'Title for campaign', with: 'New computer for Steve'
			fill_in 'Description of gift:', with: 'New macbook pro'
			fill_in 'Reason for gift:', with: 'Steves birthday is coming up. Lets get him a new computer!'
			fill_in 'Campaign goal:', with: 1500
			find('#new-campaign-submit').trigger('click')
			expect(page).to have_content 'End date can\'t be blank'
		end

		scenario 'Tries to unsuccessfully add a new gift without a campaign goal' do
			click_on 'Create New Gift Campaign'

			fill_in 'Title for campaign', with: 'New computer for Steve'
			fill_in 'Description of gift:', with: 'New macbook pro'
			fill_in 'Reason for gift:', with: 'Steves birthday is coming up. Lets get him a new computer!'
			fill_in 'Campaign end date:', with: 'Fri, 30 May 2014'
			find('#new-campaign-submit').trigger('click')
			expect(page).to have_content 'Goal can\'t be blank'
		end

	end
end
