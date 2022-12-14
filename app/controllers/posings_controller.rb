class PosingsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
  before_action :set_posing, only: [:show, :edit, :update, :destroy]
  before_action :move_index, only: [:edit, :destroy]

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
    @comment = Comment.new
    @comments = @posing.comments.includes(:user)
  end

  def edit
  end

  def update
    if @posing.update(posing_params)
      redirect_to posing_path(@posing)
    else
      render :edit
    end
  end

  def destroy
    @posing.destroy
    redirect_to root_path
  end

  private
  
  def posing_params
    params.require(:posing).permit(:image, :group_id, :category_id, :type_id, :body_weight, :remarks).merge(user_id: current_user.id)
  end

  def set_posing
    @posing = Posing.find(params[:id])
  end

  def move_index
    return redirect_to root_path if current_user.id != @posing.user.id
  end
end
