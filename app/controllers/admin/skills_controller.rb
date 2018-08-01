class Admin::SkillsController < Admin::ApplicationController
  before_action :load_skill, only: %i(edit update destroy)
  def index
    @skills = Skill.paginate(page: params[:page], per_page: 5)
  end

  def new
    @skill = Skill.new
  end

  def create
     @skill = Skill.new skill_params
    if @skill.save
      flash[:success] = t ".created"
      redirect_to admin_skills_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @skill.update skill_params
      flash[:success] = t ".updated"
      redirect_to admin_skills_path
    else
      render :edit
    end
  end

  def destroy
    if @skill.destroy
      flash[:success] = t ".deleted"
    else
      flash[:warning] = t ".delete_err"
    end
    redirect_to admin_skills_path
  end

  private

  def skill_params
    params.require(:skill).permit :name
  end

  def load_skill
    @skill = Skill.find_by id: params[:id]
    return if @skill.present?
    flash[:warning] = t ".not_found"
    redirect_to admin_skills_path
  end
end
