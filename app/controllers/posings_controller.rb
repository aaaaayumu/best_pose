class PosingsController < ApplicationController
  def index
  end

  def new
    @posing = Posing.new
  end

  def create
    @posing = Posing.new(posing_params)
    if @posing.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  
  def posing_params
    params.require(:posing).permit(:image, :group_id, :category_id, :type_id, :body_weight, :remarks).merge(user_id: current_user.id)
  end
end
