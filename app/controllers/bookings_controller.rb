class BookingsController < ApplicationController



  def show
    @booking = Booking.find(params[:id])
    authorize @booking
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
