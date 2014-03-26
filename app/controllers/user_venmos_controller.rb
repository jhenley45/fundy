class UserVenmosController < ApplicationController
  def index
  end

  def confirm_venmo
  	UserVenmo.get_user_venmo_info(params[:code], current_user)
  end

  def new
  end

  def create

  end

  def update
  end
end
