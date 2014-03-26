require 'spec_helper'

describe UserVenmo do
  describe 'associations' do
  		it { should belong_to(:user) }
  	end
end
