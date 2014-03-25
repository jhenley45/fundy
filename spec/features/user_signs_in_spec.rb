require 'spec_helper'

feature 'User Signs In' do

	background do
		@user = create(:user)
		visit root_path
	end

	scenario 'Signs in successfully' do
		sign_in_as(@user)
		expect(page).to have_content(@user.email)
	end

	scenario 'Signs in unsuccessfully without password' do
		visit root_path
		click_on 'User Login'
		fill_in 'Email', with: @user.email
		click_button 'Sign in'
		expect(page).to have_content('Invalid email or password')
	end

	scenario 'Signs in unsuccessfully without email' do
		visit root_path
		click_on 'User Login'
		fill_in 'Password', with: @user.password
		click_button 'Sign in'
		expect(page).to have_content('Invalid email or password')
	end

end
