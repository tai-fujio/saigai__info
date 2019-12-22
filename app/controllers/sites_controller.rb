class SitesController < ApplicationController
  protect_from_forgery except: [:create]

  def create
    @map = Map.find(params[:map_id])
    @site = @map.sites.build(site_params)
    @site.save
    redirect_to map_path(@map)
  end

  def new
    @map = Map.find(params[:map_id])
    @site = @map.sites.build
    respond_to do |format|
      format.js{render :index}
    end
  end

  def show
    @site = Site.find(params[:id])
    @map = Map.find(@site.map_id)
    @comment = @site.comments.build
    @comments = @site.comments
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
      # format.js{'index_comment.js.erb'}
    end
  end

  private
  def site_params
    params.require(:site).permit(:id,:name,:latitude,:longitude,:description,:title)
  end
end
