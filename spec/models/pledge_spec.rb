require 'spec_helper'

describe Pledge do

	describe 'validations' do

		it 'is invalid without an amount' do
			expect(Pledge.create(user_id: 1, gift_id: 1, owner: true)).to_not be_valid
		end

		it 'is valid when all required fields are entered' do
			expect(Pledge.create(user_id: 1, gift_id: 1, amount: 34)).to be_valid
		end
	end

	describe 'associations' do
		it { should belong_to(:user) }
		it { should belong_to(:gift) }
	end
end
