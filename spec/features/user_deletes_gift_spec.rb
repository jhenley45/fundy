require 'spec_helper'

feature 'User Signs In' do

	context 'when signed in' do
		background do
			pledge = create(:pledge)
			pledge.user.create_venmo_account(first_name: 'Jack', last_name: 'Hanley')
			visit root_path
			sign_in_as(pledge.user)
			click_on 'test gift'
		end

		scenario 'Deletes a new gift successfully' do
			find('#delete-gift-button').click
			expect(page).to have_content('Your campaign \'test gift\' has been successfully deleted.')
		end

	end
end
