class WinesController < ApplicationController

  def index
    if params[:search]
      @wines = Wine.where('name LIKE ?', "%#{params[:search]}%")
      @feature = Feature.where('name LIKE ?', "%#{params[:search]}%")
      @images = WinesImage.all
    else
      @wines = Wine.all
      @feature = Feature.all
      @images = WinesImage.all
    end
  end

  def new
    @wine = Wine.new
    @feature = Feature.all
    @wine.wines_images.build
  end

    def create
      @wine = Wine.new(wine_params)
      if @wine.save!
        redirect_to postcomplete_wines_path
      else
        render 'new'
    end
  end

  def postcomplete
  end

  def show
    @wine = Wine.find(params[:id])
    @wineimages = WinesImage.find_by(wine_id: @wine.id)
    @feature = Feature.where(id: @wine.feature_ids)
  end

  private

  def wine_params
    params.require(:wine).permit( :name, :comment, :shop_name, feature_ids: [], wines_images_attributes: [:images]).merge( user_id: current_user.id)
  end

end