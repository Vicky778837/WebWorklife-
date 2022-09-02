class ApplicationController < ActionController::Base

	include SessionsHelper
    add_flash_types :info, :error, :success, :danger


  private
  def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "You have successfully logged out."
        redirect_to login_url
      end
  end
end
