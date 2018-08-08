class Admin::ApplicationController < ActionController::Base
  before_action :logged_in_admin
  include SessionsHelper

  private

  def logged_in_admin
    if logged_in?
      check_role
      return
    end
    store_location
    flash[:danger] = t "admin.application.please_log_in"
    redirect_to login_path
  end

  def check_role
    return if current_user.admin?
    flash[:danger] = t "admin.application.not_access"
    redirect_to root_path
  end
end
