class Gift < ActiveRecord::Base
	has_many :pledges
	has_many :users, -> { uniq }, through: :pledges

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

  # Checks to see if the gift is now funded
  def check_if_funded
  	pledge_sum = Pledge.sum(:amount, conditions: {gift_id: self.id})
  	if pledge_sum >= self.goal
  		self.funded = true
  		self.save
      return true
  	else
      false
    end
  end

  #Initiates charging for a gift
  def charge_gift_pledges
  	gift_creator = User.find(self.pledges.where(owner: true).first.user_id)
  	pay_to = gift_creator.venmo_account.venmo_id
  	pledges = self.pledges.where(owner: false, status: nil)

  	pledges.each do |pledge|
      pledge.process_pledge(pay_to)
  	end
  end

  # Returns true if all of the payments have been settled
  def check_gift_payments
    gift_creator = User.find(self.pledges.where(owner: true).first.user_id)

    all_pledge_status = self.pledges.where.not(user_id: gift_creator.id).map do |pledge|
      pledge.status
    end
    all_pledge_status.all?{|i| i == 'settled'}
  end

  # Returns the full name of a gift owner
  def owner_full_name
    user = User.find(self.pledges.where(owner: true).first.user_id)
    user.venmo_account.first_name + ' ' + user.venmo_account.last_name
  end

  # Returns the percentage a gift has been funded
  def percentage_funded
    pledge_sum = Pledge.sum(:amount, conditions: {gift_id: self.id})
    ((pledge_sum/self.goal) * 100)
  end

  # TODO
  def send_gift_pledge_emails
    self.pledges.each do |pledge|
      # send email to user for each pledge
    end
  end

  # TODO
  def send_gift_owner_email
    # Email the gift owner when their gift is check_if_funded
  end

end
