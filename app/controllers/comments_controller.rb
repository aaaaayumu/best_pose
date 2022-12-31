class CommentsController < ApplicationController

  def create
    @comment = comment.new(comment_params)
  end

  private

  def comment_params
    params.require(:comment).permit(:content).merge(user_id: currnet_user.id, posing_id: params[:posing_id])
  end
end
