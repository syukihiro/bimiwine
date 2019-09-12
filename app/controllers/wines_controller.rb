class WinesController < ApplicationController

  def index
  end

  def new
    @wine = Wine.new
    @feature = Feature.all
    @wine.wines_images.build
  end

  def create
    @wine = Wine.new(wine_params)
    @wine.save!
  end

  private

  def wine_params
    params.require(:wine).permit( :name, :comment, :shop_name, feature_ids: [], wines_images_attributes: [:images]).merge( user_id: current_user.id)
  end

end