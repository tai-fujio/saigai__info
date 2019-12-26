class SitesController < ApplicationController

  def delete
    @site = Site.find(params[:id])
    @map = Map.find(params[:map_id])
    if @map.authenticate(params[:password])
      @site.destroy
      redirect_to map_path(@map)
    else
      render file: "#{Rails.root}/public/password_error.html.erb", layout: false, status: 401
    end
  end

  def create
    @map = Map.find(params[:map_id])
    @site = @map.sites.build(site_params)
    @site.save
    redirect_to map_path(@map)
  end

  def show
    @site = Site.find(params[:id])
    @map = Map.find(@site.map_id)
    @comment = @site.comments.build
    @comments = @site.comments
    respond_to do |format|
      format.js{render :index}
      format.html{render partial: "sites/show",locals: { site:@site }}
    end
  end

  def update
    @site = Site.find(params[:id])
    @map = Map.find(@site.map_id)
    @site.update(site_params)
    if @site.invalid?
      respond_to do |format|
        format.js{render :validation_error and return}
      end
    end
    respond_to do |format|
      format.js{render :update_site and return}
      format.html{render 'maps/show'}
    end
  end

  private
  def site_params
    params.require(:site).permit(:name,:latitude,:longitude,:title)
  end
end
