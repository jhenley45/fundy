require 'spec_helper'

describe Invitation do
	describe 'associations' do
		it { should belong_to(:user) }
		it { should belong_to(:gift) }
	end
end
