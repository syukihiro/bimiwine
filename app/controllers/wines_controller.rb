class WinesController < ApplicationController

  def index
    if params[:search]
      @wines = Wine.where('name LIKE ?', "%#{params[:search]}%").page(params[:page]).per(2)
      @feature = Feature.where('name LIKE ?', "%#{params[:search]}%")
      @images = WinesImage.all
      @like = Like.new
    else
      @wines = Wine.page(params[:page]).per(2)
      @feature = Feature.all
      @images = WinesImage.all
      @like = Like.new
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
    @like = Like.new
  end

  def edit
    @wine = Wine.find(params[:id])
    @wineimages = WinesImage.find_by(wine_id: @wine.id)
    @feature = Feature.where(id: @wine.feature_ids)
    @feature = Feature.all
  end

  def update
    @wine = Wine.find(params[:id])
    if @wine.update!(wine_params)
     redirect_to editcomplete_wines_path
  end
end

  def deletebefore
    @wine = Wine.find(params[:id])
  end


  def destroy
    @wine = Wine.find(params[:id])
    if @wine.destroy
      redirect_to deletecomplete_wines_path
  end
end

  def deletecomplete

  end

  def usereditcomplete

  end

  def goodpage
    @likes = Like.where(user_id: current_user.id)
    
  end

  private

  def wine_params
    params.require(:wine).permit( :name, :comment, :shop_name, feature_ids: [], wines_images_attributes: [:id, :images]).merge( user_id: current_user.id)
  end

end