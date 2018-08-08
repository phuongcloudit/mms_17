# frozen_string_literal: true

class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by email: params[:session][:email].downcase
    if user&.authenticate(params[:session][:password])
      user_login user
    else
      flash.now[:danger] = t(".invalid")
      render :new
    end
  end

  def destroy
    log_out
    redirect_to root_path
  end

  private

  def user_login user
      log_in user
      check_remember user
      check_user_admin
  end

  def check_user_admin
    if current_user.admin?
      redirect_to admin_teams_path
    else
      flash[:success] = t ".welcome"
      redirect_to root_path
    end
  end
end
