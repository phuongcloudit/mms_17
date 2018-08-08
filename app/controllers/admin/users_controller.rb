class Admin::UsersController < Admin::ApplicationController
  before_action :load_user, only: %i(destroy edit update show)
  def index
    @users = User.paginate page: params[:page], per_page: 5
  end

  def new
    @user = User.new
    @projects = Project.all
    @teams = Team.all
    @positions = Position.all
  end

  def create
    @teams = Team.all
    @projects = Project.all
    @positions = Position.all
    @user = User.new user_params
    if @user.save
     flash.now[:success] = t ".created"
      redirect_to admin_users_path
    else
      render :new
    end
  end

  def edit
    @positions = Position.all
    @teams = Team.all
    @projects = Project.all
  end

  def update
    @positions = Position.all
    @teams = Team.all
    @projects = Project.all
    if @user.update_attributes user_params
      flash[:success] = t ".updated"
      redirect_to admin_users_path
    else
      render :edit
    end
  end

  def show

  end

  def destroy
    if @user.destroy
      flash[:success] = t ".deleted"
    else
      flash[:warning] = t ".delete_err"
    end
    redirect_to admin_users_path
  end

  private

  def load_user
    @user = User.find_by id: params[:id]
    return if @user.present?
    flash[:warning] = t ".not_found"
    redirect_to admin_users_path
  end

  def user_params
    params.require(:user).permit :name, :email, :password, :password_confirmation, :birthday,
                    :avatar, :position_id, :team_id, :project_ids
  end
end
