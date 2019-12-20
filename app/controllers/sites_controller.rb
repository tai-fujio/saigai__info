class SitesController < ApplicationController
  protect_from_forgery except: [:create]

  def create
    @map = Map.find(params[:map_id])
    @site = @map.sites.build(site_params)
    # map_id = params[:map_id]
    # @site.map_id = map_id
    @site.save
    redirect_to map_path(@map)
  end

  def new
    @map = Map.find(params[:map_id])
    @site =@map.sites.build
    respond_to do |format|
      format.js{render :index}
    end
  end

  def show
    @site = Site.find(params[:id])
    @map = Map.find(@site.map_id)
    @review = @site.reviews.build
    @reviews = @site.reviews
    respond_to do |format|
      format.js{render :index}
    end
  end

  def update
    @site = Site.find(params[:id])
    @map = Map.find(@site.map_id)
    @site.update(site_params)
    respond_to do |format|
      format.js{render :update_site}
      # format.js{'index_review.js.erb'}
    end
  end

  private
  def site_params
    params.require(:site).permit(:id,:name,:latitude,:longitude,:description)
  end
end