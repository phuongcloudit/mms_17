class Admin::TeamsController < Admin::ApplicationController
  before_action :load_team, only: %i(edit update destroy show add_member)
  def new
    @team = Team.new
    @users = User.all
  end

  def edit
    @users = User.all
  end

  def update
    if @team.update team_params
      flash[:success] = t ".updated"
      redirect_to admin_teams_path
    else
      render :edit
    end
  end

  def index
    @teams = Team.paginate page: params[:page], per_page: 5
  end

  def show
    @users = @team.users.newest.paginate page: params[:page], per_page: 10
  end

  def create
    @team = Team.new team_params
    if @team.save
      flash[:success] = t ".created"
      redirect_to admin_teams_path
    else
      render :new
    end
  end

  def destroy
    if @team.destroy
      flash[:success] = t ".deleted"
    else
      flash[:warning] = t ".delete_err"
    end
    redirect_to admin_teams_path
  end

  def add_member
    @users = User.all
  end

  def update_member
    if @team.update_attributes add_member_params
      flash[:success] = t ".update_success"
    else
      flash[:danger] = t ".update_fail"
    end
    redirect_to admin_team_path @team
  end

  private

  def team_params
    params.require(:team).permit :name, :description, :leader_id, user_ids: []
  end

  def add_member_params
    params.require(:team).permit user_ids: []
  end

  def load_team
    @team = Team.find_by id: params[:id]
    return if @team.present?
    flash[:warning] = t ".not_found"
    redirect_to admin_team_path
  end
end
