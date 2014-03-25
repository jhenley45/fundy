require 'spec_helper'

feature 'User Signs In' do

	context 'when signed in' do
		background do
			@user = create(:user)
			visit root_path
			sign_in_as(@user)
			add_new_gift
		end

		scenario 'Deletes a new gift successfully' do
			click_on 'Delete this campaign'
			expect(page).to have_content('Your campaign \'New computer for Steve\' has been successfully deleted.')
		end

	end
end
