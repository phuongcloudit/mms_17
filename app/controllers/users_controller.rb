class UsersController < ApplicationController
  before_action :logged_in
  def show
    load_user
  end

  def load_user
    @user = User.find_by id: params[:id]
    return if @user.present?
    flash[:warning] = t ".not_found"
    redirect_to root_path
  end
end
