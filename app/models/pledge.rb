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

  validates :amount, presence: true, :numericality => { :greater_than => 0 }


  # Calls remote_pledge for a given pledge and processes the results for DB
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

  # Sends POST request to Venmo to process a single pledge
  # Returns JSON for body of response
  def remote_pledge(pay_to)
  	venmo_info = self.user.venmo_account
  	request = 'https://api.venmo.com/v1/payments'
  	response = HTTParty.post(request, query: {
        access_token: venmo_info.access_token,
        user_id: pay_to,
        amount: self.amount.to_s,
        note: 'Payment from my app'
      })

  	JSON.parse(response.body)
  end

  # def pledge_gift
  #   Gift.find(self.gift_id)
  # end

  # Returns full name for the owner of a pledge
  def pledge_owner_full_name
    user = User.find(self.user_id)
    user.venmo_account.first_name + ' ' + user.venmo_account.last_name
  end

end
