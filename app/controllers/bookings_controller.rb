class BookingsController < ApplicationController

  def index
    @bookings = policy_scope(Booking).where(user: current_user).order(start_time: :desc)
    # @bookings = Booking.where(user: current_user)
    authorize @bookings
  end

  def show
    # authorize @booking
  end

  def new
    # authorize @booking
  end

  def create
    # authorize @booking
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
end
