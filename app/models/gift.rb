class Gift < ActiveRecord::Base
	has_many :pledges
	has_many :users, through: :pledges

	validates :name, presence: true
	validates :end_date, presence: true
	validates :goal, presence: true
	validates_numericality_of :goal, on: :create
	validates_numericality_of :goal, on: :update

	# This method associates the attribute ":avatar" with a file attachment
  has_attached_file :avatar,
  	:default_url => "/missing.png",
  		styles: {
		    thumb: '100x100>',
		    square: '200x200#',
		    medium: '300x300>',
		    large: '500x500>'
  		},
  	default_style: :large

  # Validate the attached image is image/jpg, image/png, etc
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/


end
