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

  def check_pledge_total
  	pledge_sum = Pledge.sum(:amount, conditions: {gift_id: self.id})
  	if pledge_sum >= self.goal
  		self.charge_gift_pledges
  		self.funded = true
  		self.save
  	end
  end

  def charge_gift_pledges
  	gift_creator = User.find(self.pledges.where(owner: true).first.user_id)
  	pay_to = gift_creator.venmo_account.venmo_id
  	pledges = self.pledges.where(owner: false, charged: nil)

  	pledges.each do |pledge|
  		venmo_info = pledge.user.venmo_account
  		request = 'https://api.venmo.com/v1/payments?'
  		request += 'access_token=' + venmo_info.access_token
  		request += "&user_id=" + pay_to
  		request += "&amount=" + pledge.amount.to_s
  		request += '&note=Payment-of-' + pledge.amount.to_s + '-by-my-app'
  		response = HTTParty.post(request)

  		body = JSON.parse(response.body)
  		if body['data']['payment']['status'].in?(['settled', 'pending'])
	  		pledge.charged = true
	  		pledge.save
	  	else
	  		pledge.charged = false
	  		pledge.save
	  	end
  	end

  end

end
