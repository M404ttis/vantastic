class VansController < ApplicationController
  def index
    if params[:query].present?
    @vans = Van.where(location: params[:query])
    else
      @vans = Van.all
    end
    @vans = policy_scope(Van).order(created_at: :desc)
  end

  def new
    authorize @van
  end

  def create
    authorize @van
  end

  def update
    authorize @van
  end

  def edit
    authorize @van
  end

  def destroy
    authorize @van
  end

  def show
    authorize @van
  end
end
