class FindsController < ApplicationController

  def search
    @map = Map.find(params[:map_id])
    @site = @map.sites.build
    results = Geocoder.search(params[:place])
    filtered_results = results.find_all{|n| n.country_code == 'jp'}
    @sites_composed = filtered_results.map do |site|
      {
        latitude: site.latitude,
        longitude: site.longitude,
        name: "fas fa-search fa-3x faa-flash animated",
        display_name: site.display_name
      }
    end
    @sites_composed.map{|n| n[:lat] = n.delete :latitude}
    @sites_composed.map{|n| n[:lng] = n.delete :longitude}
    if @sites_composed.empty?
        redirect_to map_path(@map) and return
    end
    # 配列の並びを地点登録時と合わせるための処理
    @sites_composed.push({name:"fas fa-search fa-3x faa-flash animated",display_name:"null",lat:0,lng:0})
    respond_to do |format|
      format.html{redirect_to controller: 'finds', action: 'show' ,locals: {site: @site,map: @map,sites_composed: @sites_composed}}
    end
  end

  def show
    @map = Map.find(params[:locals][:map])
    @site = @map.sites.build
    @sites_composed = params[:locals][:sites_composed]
  end
end
