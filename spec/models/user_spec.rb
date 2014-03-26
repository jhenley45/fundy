require 'spec_helper'

describe User do

	describe 'associations' do
		it { should have_many(:gifts) }
		it { should have_many(:pledges) }
		it { should have_one(:user_venmo) }

	end
end
