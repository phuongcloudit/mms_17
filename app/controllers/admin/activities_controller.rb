class Admin::ActivitiesController < Admin::ApplicationController
  def index
    @activities = PublicActivity::Activity.paginate page: params[:page], per_page: 20
  end
end
