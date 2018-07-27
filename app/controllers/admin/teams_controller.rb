class Admin::TeamsController < Admin::ApplicationController
  before_action :load_team, except: %i(index new create)
  before_action :load_all_user, only: %i(new edit update add_member create)

  def index
    @teams = Team.paginate page: params[:page], per_page: Settings.team.per_page
  end

  def new
    @team = Team.new
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

  def edit; end

  def update
    if @team.update team_params
      flash[:success] = t ".updated"
      redirect_to admin_teams_path
    else
      render :edit
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

  def show
    @users = @team.users.newest.paginate page: params[:page],
                                        per_page: Settings.page_team
  end

  def add_member; end

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

  def load_all_user
    @users = User.all
  end
end
