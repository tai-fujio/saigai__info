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
    map_id: site.map.id
    }
    end
  end

  def index
    @map = Map.new
    @maps = Map.all
  end

  def show
    @maps = Map.all
    if params[:id] == ""
      flash.now[:notice] = "マップを選んでください"
      render :index
    else
      @map = Map.find(params[:id])
      @site = @map.sites.build
      sites
      @all_sites = compose(@sites)
    end
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
      render :new
    end
  end

  private
  def map_params
    params.require(:map).permit(:name,:password,:password_confirmation,:creater)
  end

end
