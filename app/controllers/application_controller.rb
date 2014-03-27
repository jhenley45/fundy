class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)
  	if current_user.venmo_account == nil
  		new_venmo_account_path
  	else
  		root_path
  	end
  end

  def after_sign_up_path_for(resource)
  	new_venmo_account_path
  end
end
