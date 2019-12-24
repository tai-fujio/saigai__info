class Admin::MapsController < ApplicationController
  layout "admin_page"

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

  def show
    @map = Map.find(params[:id])
    @site = @map.sites.build
    sites
    @all_sites = compose(@sites)
  end

end
