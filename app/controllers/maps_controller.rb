class MapsController < ApplicationController

  def root; end

  def sites
    @sites ||= @map.sites
  end

  def compose(sites)
    sites.map do |site|
    {lat: site.latitude,
    lng: site.longitude,
    name: site.name,
    id: site.id,
    map_id: site.map_id
    }
    end
  end

  def index
    @maps = Map.all
  end

  def show
    @map = Map.find(params[:id])
    @site = @map.sites.build
    sites
    @all_sites = compose(@sites)
  end

  def destroy;end

  def new
    @map = Map.new
  end

  def create
    @map = Map.new(map_params)
    if @map.save
      flash[:notice] = "マップを作成しました"
      redirect_to root_path
    else
      flash.now[:notice] = "マップの作成ができませんでした"
      render :new
    end
  end

  private
  def map_params
    params.require(:map).permit(:name,:password,:creater)
  end

end
