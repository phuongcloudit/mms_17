class Admin::ApplicationController < ActionController::Base
  include PublicActivity::StoreController
  include CanCan::ControllerAdditions
  protect_from_forgery with: :exception
  before_action :configure_user_parameters, if: :devise_controller?
  load_and_authorize_resource

  rescue_from CanCan::AccessDenied do |exception|
    flash[:danger] = exception.message
    redirect_to root_path
  end

  protected

  def configure_user_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |user_params|
      user_params.permit :username, :birthday, :email, :password, :password_confirmation, :avatar, :team_id, :position_id, :remember_me
    end
    devise_parameter_sanitizer.permit(:sign_in) do |user_params|
      user_params.permit :username, :email, :password, :remember_me
    end
    devise_parameter_sanitizer.permit(:account_update) do |user_params|
      user_params.permit :username, :birthday, :email, :password, :password_confirmation, :avatar, :team_id, :position_id, :remember_me
    end
  end
end
