class VansController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  def index
    @vans  = policy_scope(Van).order(created_at: :desc)
  end
  
  def show
    @van = Van.find(params[:id])
    authorize @van
  end

  def new
    @van = Van.new
    authorize @van
  end
  
  # def create
  #   # @van = Van.new(strong_params)
  #   # authorize @van
  #   # @van.user = current_user
  #   # if @van.save....
  # end
  
  # def update
  #   # authorize @van
  # end
  
  # def edit
  #   # authorize @van
  # end
  
  # def destroy
  #   # authorize @van
  # end
  
  # private

  # def strong_params
  # end



end
