class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @wine = @user.wines
    @winesimages = WinesImage.where(params[:id]).order("created_at DESC")
  end
end
