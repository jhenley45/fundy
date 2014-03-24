require 'spec_helper'

describe Gift do

	describe 'validations' do

	  it 'is invalid without a name' do
	  	expect(Gift.create(description: 'a new gift', reason: 'birthday',
	  	end_date: DateTime.new(), goal: 400)).to_not be_valid
	  end

	  it 'is invalid without an end_date' do
	  	expect(Gift.create(name: 'my new gift', description: 'a new gift',
	  	reason: 'birthday', goal: 400)).to_not be_valid
	  end

	  it 'is invalid without a goal' do
	  	expect(Gift.create(name: 'new gift', description: 'a new gift', reason: 'birthday',
	  	end_date: DateTime.new())).to_not be_valid
	  end
	end

	describe 'associations' do
		it { should have_many(:users) }
		it { should have_many(:pledges) }
	end
end
