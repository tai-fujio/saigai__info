class FindsController < ApplicationController

  def search
    @map = Map.find(params[:map_id])
    @site = @map.sites.build
    @search = InputForm.new(params.permit(:place))
    if @search.invalid?
      redirect_to map_path(@map) and return
    end
    # results = Geocoder.search(params[:place])
    client = GooglePlaces::Client.new(ENV['GOOGLE_API_KEY'])
    results = client.spots_by_query(params[:place])
    filtered_results = results.find_all{|n| n.formatted_address.include?("Japan") == true}
    @sites_composed = filtered_results.first(9).map do |site|
      {
        lat: site.lat,
        lng: site.lng,
        name: "fas fa-search fa-3x faa-flash animated",
        display_name: site.name
      }
    end
    if @sites_composed.empty?
        redirect_to map_path(@map) and return
    end
    # 配列の並びを地点登録時と合わせるための処理
    @sites_composed.push({name:"",display_name:"null",lat:0,lng:0})
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
