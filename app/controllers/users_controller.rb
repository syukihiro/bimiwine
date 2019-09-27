class UsersController < ApplicationController

  def show
    @user = User.find_by(id: current_user.id)
    @wine = @user.wines
    @winesimages = WinesImage.where(wine_id: @wine.ids).order("created_at DESC")
  end
end