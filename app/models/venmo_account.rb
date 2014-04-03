class VenmoAccount < ActiveRecord::Base
  belongs_to :user

  # Sends POST request to Venmo to get info on a user and
  # calls store_venmo_info
  def self.get_user_venmo_info(code, user)
		request = 'https://api.venmo.com/v1/oauth/access_token'
		response = HTTParty.post(request, query: {
        client_id: ENV['VENMO_CLIENT_ID'],
        code: code,
        client_secret: ENV['VENMO_CLIENT_SECRET']
      })
		VenmoAccount.store_venmo_info(JSON.parse(response.body), user)
  end

  # Stores info returned by get_user_venmo_info in DB
  def self.store_venmo_info(info, user)
  	user.create_venmo_account(
  		access_token: info['access_token'],
  		expires_in: info['expires_in'].to_i,
  		username: info['user']['username'],
  		first_name: info['user']['first_name'],
  		last_name: info['user']['last_name'],
  		display_name: info['user']['display_name'],
  		about: info['user']['about'],
  		profile_pic: info['user']['profile_picture_url'],
  		venmo_id: info['user']['id'].to_i,
  		refresh_token: info['refresh_token']
  	)
  end
end
