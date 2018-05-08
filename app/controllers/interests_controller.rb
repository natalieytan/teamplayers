class InterestsController < ApplicationController
  before_action :set_interest, only: [:edit, :update, :destroy]
  before_action :auth_actions, only: [:edit, :update, :destroy]

  def index
    @interests = current_user.interests
    @interest = Interest.new
  end

  def create
    @interests = current_user.interests
    @interest = Interest.new(interest_params)
    @interest.user = current_user
    if @interest.save
      flash[:notice] = "Interest Added"
      redirect_to interests_path
    else
      flash.now[:alert] = "Unable to add interest"
      render :index
    end
  end

  def edit
  end

  def update
    if @interest.update(interest_params)
      flash[:notice] = "Interest updated!"
      redirect_to interests_path
    else
      flash.now[:alert] = "Unable to update interest!"
      render 'edit'
    end
end


  def destroy
    @interest.destroy
    redirect_to interests_path, notice: 'Successfully deleted interest.'
  end


  private
  def set_interest
    @interest = Interest.find(params[:id])
  end

  def interest_params
    params.require(:interest).permit(:sport_id, :skill)
  end

  def auth_actions
    authorize @interest
  end

end
