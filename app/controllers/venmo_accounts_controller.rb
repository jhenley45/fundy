class VenmoAccountsController < ApplicationController
  def index
  end

  def confirm_venmo
  	if params['error'].present?
  		flash['alert'] = 'Please try again. In order to participate in this app, you must authorize access to your Venmo account.'
  		redirect_to new_venmo_account_path and return
  	end
  	VenmoAccount.get_user_venmo_info(params[:code], current_user)
    flash['alert'] = 'Successfully authorized your Venmo account'
    redirect_to venmo_account_path(id: current_user.venmo_account.id)
  end

  def new
  end

  def show
    @venmo_account = VenmoAccount.find(params[:id])
  end

  def create

  end

  def update
  end
end
