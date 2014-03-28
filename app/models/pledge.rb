class Pledge < ActiveRecord::Base
  belongs_to :user
  belongs_to :gift

  STATES = {
  	"settled" => "Payment successfully processed.",
  	"pending" => "Payment is pending",
  	"failed" => 'Payment failed.',
  	'expired' => 'Payment has expired.',
  	'cancelled' => 'Payment was cancelled',
  	'error' => 'There was an error processing this payment through Venmo.'
  }

  validates :amount, presence: true
  validates_numericality_of :amount, on: :create
  validates_numericality_of :amount, on: :update


  def process_pledge(pay_to)
  	body = self.remote_pledge(pay_to)

  	if body['error'].present?
      self.status_msg = body['error']['message']
      self.status = 'error'
		elsif body['data']['payment']['status'].present?
			# settled, pending, failed, expired, cancelled
		  self.status = body['data']['payment']['status']
		  self.status_msg = STATES[self.status]
  	else
  		self.status = 'error'
      self.status_msg = STATES[self.status]
  	end
  	self.save
  end

  def remote_pledge(pay_to)
  	venmo_info = self.user.venmo_account
  	request = 'https://api.venmo.com/v1/payments?'
  	request += 'access_token=' + venmo_info.access_token
  	request += "&user_id=" + pay_to
  	request += "&amount=" + self.amount.to_s
  	request += '&note=Payment-of-' + self.amount.to_s + '-by-my-app'
  	response = HTTParty.post(request)
  	JSON.parse(response.body)
  end

  def pledge_gift
    Gift.find(self.gift_id)
  end

end
