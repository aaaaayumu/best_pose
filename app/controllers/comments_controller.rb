class CommentsController < ApplicationController

  def create
    @comment = Comment.new(comment_params)
    @posing = Posing.find(params[:posing_id])
    if @comment.save
      redirect_to posing_path(@comment.posing.id)
    else
      render 'posings/show'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id, posing_id: params[:posing_id])
  end
end
