module GoogleSearch
  def self.search_spot(place)
    @client = GooglePlaces::Client.new(ENV['GOOGLE_API_KEY'])
    get_data(place)
  end

  def self.get_data(place)
    results = @client.spots_by_query(place)
    # 検索結果を日本に限定
    return results.find_all{|n| n.formatted_address.include?("Japan") == true}
  end
end
