class Admin::RegistrationsController < Devise::RegistrationsController
  before_action :load_object, only: %i(new)
  def new
  end

  def load_object
    @user = User.new
    @projects = Project.all
    @teams = Team.all
    @positions = Position.all
  end
end
