class Gift < ActiveRecord::Base
	has_many :pledges
	has_many :users, through: :pledges

	validates :name, presence: true
	validates :end_date, presence: true
	validates :goal, presence: true

end
