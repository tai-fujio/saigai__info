require 'rails_helper'

RSpec.describe Site, type: :model do
  before do
    @map = FactoryBot.create(:map)
    @site = FactoryBot.create(:site,map_id:@map.id)
  end
  describe 'バリデーションテスト' do
    it "name非ナル制約テスト" do
      @site.name = nil
      @site.valid?
      expect(@site.errors.messages[:name]).to include ("を入力してください")
    end
    it "latitude非ナル制約テスト" do
      @site.latitude = nil
      @site.valid?
      expect(@site.errors.messages[:latitude]).to include ("を入力してください")
    end
    it "longitude非ナル制約テスト" do
      @site.longitude = nil
      @site.valid?
      expect(@site.errors.messages[:longitude]).to include ("を入力してください")
    end
    it "Site#update非ナル制約テスト" do
      @site2 = Site.new(name:"test_site2",title:nil,map_id:@map.id,latitude:36,longitude:136)
      @site.title = nil
      @site.valid?
      expect(@site2.valid?).to eq true
      expect(@site.errors.messages[:title]).to include ("を入力してください")
    end
    it "title文字数制約テスト" do
      @site.title = "#{'a'*201}"
      @site.valid?
      expect(@site.errors.messages[:title]).to include ("は200文字以内で入力してください")
    end
    it "longitude,latitudeの組み合わせユニークテスト" do
      @site3 = Site.new(name:"test_site3",map_id:@map.id,latitude:35,longitude:135)
      @site4 = Site.new(name:"test_site3",map_id:@map.id,latitude:35,longitude:136)
      @site3.valid?
      expect(@site3.errors.messages[:longitude]).to include ("はすでに存在します")
      expect(@site4.valid?).to eq true
    end
  end
end
