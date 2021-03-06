class VansController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  # geocoded_by :location
  # after_validation :geocode, if: :will_save_change_to_address?

  def index
    if params[:query].present?
      @vans = policy_scope(Van).where(location: params[:query]).order(created_at: :desc)
    else
      @vans = policy_scope(Van).order(created_at: :desc)
    end
  end

  def new
    @van = Van.new
    authorize @van
  end

  def create
    @van = Van.new(set_params)
    @van.user = current_user
    @van.save
    if @van.save
      redirect_to van_path(@van)
    else
      render :new
    end
    authorize @van
  end

  def update
    @van = Van.find(params[:id])
    @van.update(set_params)
    if @van.save
      redirect_to van_path(@van)
    else
      render :edit
    end
    authorize @van
  end

  def edit
    @van = Van.find(params[:id])
    authorize @van
  end

  def destroy
    @van = Van.find(params[:id])
    @van.user = current_user
    authorize @van
    @van.delete
    redirect_to vans_path
  end

  def show
    @van = Van.find(params[:id])
    @booking = Booking.new
    authorize @van

    @markers = [
      {
        lat: @van.latitude,
        lng: @van.longitude
      }
    ]
  end

  private

  def set_params
    params.require(:van).permit(:title, :brand, :model, :description, :photo, :price_per_day, :location)
  end
end
