class UsersController < ApplicationController
  before_action :move_index, only: :edit

  def edit
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def show
    @user = User.find(params[:id])
    @posings = @user.posings
  end

  private
  def user_params
    params.require(:user).permit(:nickname, :email, :password, :password_confimation, :body_height, :body_weight, :self_introduction)
  end

  def move_index
    redirect_to root_path if current_user.id != params[:id].to_i
  end
end
