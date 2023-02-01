class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @posings = @user.posings
  end
end
