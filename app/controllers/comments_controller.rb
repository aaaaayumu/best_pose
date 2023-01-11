class CommentsController < ApplicationController
  before_action :authenticate_user!, only: :edit
  before_action :set_posing, only: [:create, :edit, :update, :destroy]
  before_action :set_comment, only: [:edit, :update, :destroy]
  before_action :move_index, only: [:edit, :destroy]

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to posing_path(@comment.posing.id)
    else
      render 'posings/show'
    end
  end

  def edit
  end

  def update
    if @comment.update(comment_params)
      redirect_to posing_path(@posing)
    else
      render :edit
    end
  end

  def destroy
    @comment.destroy
    redirect_to posing_path(@posing)
  end

  private

  def comment_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id, posing_id: params[:posing_id])
  end

  def set_posing
    @posing = Posing.find(params[:posing_id])
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def move_index
    redirect_to root_path if current_user.id != @comment.user.id
  end
end
