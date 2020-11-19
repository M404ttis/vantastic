class BookingsController < ApplicationController
  def index
    @bookings = policy_scope(Booking).where(user: current_user).order(created_at: :desc)
    # @bookings = Booking.where(user: current_user)
    authorize @bookings
  end

  def show
    @booking = Booking.find(params[:id])
    authorize @booking
  end

  def new
    # authorize @booking
  end

  def my_offers
    @user = current_user
    @offers = @user.offers
    authorize @offers
  end

  def create
    @booking = Booking.new(set_params)
    @van = Van.find(params[:van_id])
    @booking.van = @van
    @booking.user = current_user
    if @booking.save
      redirect_to bookings_path
    else
      render :new
    end
    authorize @booking
  end

  def update
    @booking = Booking.find(params[:id])
    @booking.update(set_params)
    if @booking.save
      redirect_to bookings_path
    else
      render :edit
    end
    authorize @booking
  end

  def edit
    @booking = Booking.find(params[:id])
    authorize @booking
  end

  def destroy
    @booking = Booking.find(params[:id])
    authorize @booking
    @booking.delete
    redirect_to bookings_path
  end

  private

  def set_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
