class Admin::ProjectsController < Admin::ApplicationController
  before_action :load_project, only: %i(edit update destroy)
  def index
    @projects = Project.paginate page: params[:page], per_page: 5
  end

  def new
    @project = Project.new
    @users = User.all
    @teams = Team.all
  end

  def create
    @users = User.all
    @teams = Team.all
    @project = Project.new project_params
    if @project.save
     flash[:success] = t ".created"
      redirect_to admin_projects_path
    else
      render :new
    end
  end

  def edit
    @users = User.all
    @teams = Team.all
  end

  def update
    @users = User.all
    @teams = Team.all
    if @project.update project_params
      flash[:success] = t ".updated"
      redirect_to admin_projects_path
    else
      render :edit
    end
  end

  def destroy
    if @project.destroy
      flash[:success] = t ".deleted"
    else
      flash[:warning] = t ".delete_err"
    end
    redirect_to admin_projects_path
  end

  private

  def project_params
    params.require(:project).permit :name, :short_name, :start_date,
                                  :end_date, :description, :leader_id, :team_id
  end

  def load_project
    @project = Project.find_by id: params[:id]
    return if @project.present?
    flash[:warning] = t ".not_found"
    redirect_to admin_projects_path
  end
end
