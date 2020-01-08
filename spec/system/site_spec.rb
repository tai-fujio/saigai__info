require 'rails_helper'
require 'selenium-webdriver'

RSpec.describe Site, type: :system do
  describe "Site画面" do
    before do
      @map = FactoryBot.create(:map)
      @site = FactoryBot.create(:site,map_id:@map.id)
      @site2 = FactoryBot.create(:site,map_id:@map.id,latitude:32)
    end
    context "sites#createのテスト" do
      it "longitude,latitudeの値がわたっている場合、任意に選んだアイコンの登録ができる" do
        visit 'maps/'
        select "test__map", from: "id"
        click_button("みる")
        page.execute_script("$('[id=site_latitude]')[0].value = 31")
        page.execute_script("$('[id=site_longitude]')[0].value = 131")
        create_btn = page.find(".ok_btn",match: :first,visible: false)
        create_btn.click
        expect(Site.last.latitude).to eq 31
      end
    end
    context "sites#updateのテスト" do
      it "createされたsiteにタイトルを加えることができる" do
        visit "maps/#{@map.id}/sites/#{@site.id}/"
        fill_in "site[title]", with: "テストタイトル"
        click_button("登録する")
        expect(Site.find(@site.id).title).to eq "テストタイトル"
      end
    end
    context "sites#deleteのテスト" do
      it "createされたsiteを削除することができる" do
        visit "maps/#{@map.id}/sites/#{@site2.id}/"
        fill_in "site[title]", with: "テストタイトル"
        click_button("登録する")
        visit "maps/#{@map.id}/sites/#{@site2.id}/"
        fill_in "password", with: "password"
        click_button("削除")
        expect(Site.where(id:@site2.id).empty?).to eq true
      end
    end
  end
end
