FactoryGirl.define do
require 'faker'

	factory :user do
		email Faker::Internet.email
		password 'swordfish'
	end

	factory :gift do
		name 'test gift'
		description 'testing'
		reason 'because'
		end_date '10'
		goal '400'
	end

	factory :pledge do
		user
		gift
		owner true
		amount 300
	end

	factory :venmo_account do

	end

end
