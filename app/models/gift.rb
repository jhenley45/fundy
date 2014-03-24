class Gift < ActiveRecord::Base
	has_many :pledges
	has_many :users, through: :pledges
end
