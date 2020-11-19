class BookingsController < ApplicationController

  def index
    @bookings = policy_scope(Booking).where(user: current_user).order(created_at: :desc)
    # @bookings = Booking.where(user: current_user)
    authorize @bookings
  end

  def show
    # authorize @booking
  end

  def new
    # authorize @booking
  end

  def create # rubocop:disable Metrics/MethodLength
    @booking = Booking.new(set_params)
    @van = Van.find(params[:van_id])
    @booking.van = @van
    @booking.user = current_user
    @booking.save
    if @booking.save
      redirect_to bookings_path
    else
      render :new
    end
    authorize @booking
  end

  def edit
    # authorize @booking
  end

  def update
    # authorize @booking
  end

  def destroy
    # authorize @booking
  end

  private

  def set_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
