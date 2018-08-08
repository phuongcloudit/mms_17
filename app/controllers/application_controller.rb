class ApplicationController < ActionController::Base
  include SessionsHelper

  private

  def logged_in
    if logged_in?
      return
    end
    store_location
    flash[:danger] = t "please_log_in"
    redirect_to login_path
  end
end
