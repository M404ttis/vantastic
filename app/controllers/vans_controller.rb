class VansController < ApplicationController

  def index
    if params[:query].present?
    @vans = Van.where(location: params[:query])
    else
      @vans = Van.all
    end
  end

  def new
  end

  def create
  end

  def update
  end

  def edit
  end

  def destroy
  end

  def show
  end
end
