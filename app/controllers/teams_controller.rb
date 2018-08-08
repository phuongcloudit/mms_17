class TeamsController < ApplicationController
  before_action :logged_in
  before_action :load_team, only: %i(show)
  def index
    @teams = Team.paginate(page: params[:page], per_page: 20)
  end

  def show
    @users = @team.users.newest.paginate page: params[:page],
                                        per_page: Settings.page_team
  end

  def load_team
    @team = Team.find_by id: params[:id]
    return if @team.present?
    flash[:warning] = t ".not_found"
    redirect_to admin_team_path
  end
end
