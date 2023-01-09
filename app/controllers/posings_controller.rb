class PosingsController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def index
    @posings = Posing.includes(:user).order("created_at DESC")
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

  def show
    @posing = Posing.find(params[:id])
    @comment = Comment.new
    @comments = @posing.comments.includes(:user)
  end

  def edit
    @posing = Posing.find(params[:id])
  end

  def update
    @posing = Posing.find(params[:id])
    if @posing.update(posing_params)
      redirect_to posing_path(@posing)
    else
      render :edit
    end
  end

  private
  
  def posing_params
    params.require(:posing).permit(:image, :group_id, :category_id, :type_id, :body_weight, :remarks).merge(user_id: current_user.id)
  end
end
