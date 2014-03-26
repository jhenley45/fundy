class UserVenmosController < ApplicationController
  def index
  end

  def confirm_venmo
  	if params['error'].present?
  		flash['alert'] = 'In order to participate in this app, you must authorize access to your Venmo account. Please try again'
  		redirect_to new_user_venmo_path and return
  	end
  	UserVenmo.get_user_venmo_info(params[:code], current_user)
  end

  def new
  end

  def create

  end

  def update
  end
end
