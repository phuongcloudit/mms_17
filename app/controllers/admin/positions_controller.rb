class Admin::PositionsController < Admin::ApplicationController
  before_action :load_position, only: %i(edit update destroy)
  def index
    @positions = Position.paginate(page: params[:page], per_page: 5)
  end

  def new
    @position = Position.new
  end

  def create
    @position = Position.new position_params
    if @position.save
      flash[:success] = t(".created")
      redirect_to admin_positions_path
    else
      render :new
    end
  end

  def edit; end

  def update
    if @position.update position_params
      flash[:success] = t(".updated")
      redirect_to admin_positions_path
    else
      render :edit
    end
  end

  def destroy
    if @position.destroy
      flash[:success] = t(".deleted")
    else
      flash[:warning] = t ".delete_err"
    end
    redirect_to admin_positions_path
  end

  private

  def position_params
    params.require(:position).permit :name, :short_name, :description
  end

  def load_position
    @position = Position.find_by id: params[:id]
    return if @position.present?
    flash[:warning] = t ".not_found"
    redirect_to admin_position_path
  end
end
