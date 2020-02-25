require 'rails_helper'
require 'selenium-webdriver'

RSpec.describe Map, type: :system do
  describe "Map画面" do
    before do
      @map = FactoryBot.create(:map)
    end
    context "maps#rootのテスト" do
      it "ルートがログイン画面である" do
        visit root_path
        expect(page).to have_content "Saigai info"
      end
    end
    context "maps#indexのテスト" do
      it "マップをみるを選択するとマップ選択画面にうつる" do
        visit root_path
        click_button("マップをみる")
        expect(page).to have_content "えらぶ"
      end
    end
    context "maps#newのテスト" do
      it "マップをつくるを選択するとマップ作成画面にうつる" do
        visit root_path
        click_button("マップをつくる")
        expect(page).to have_content "パスワード確認"
      end
    end
    context "maps#createのテスト" do
      it "必要事項を入力するとマップができ、root画面にうつる" do
        visit 'maps/new'
        fill_in "map[name]", with: "テストマップ"
        fill_in "map[password]", with: "111111"
        fill_in "map[password_confirmation]", with: "111111"
        click_button("つくる")
        expect(page).to have_content "Saigai info"
        click_button("マップをみる")
        expect(page).to have_content "テストマップ"
      end
    end
    context "maps#showのテスト" do
      it "マップ名を選択して見るボタンを押すとマップ画面にうつる" do
        visit 'maps/'
        select "test__map", from: "id"
        click_button("みる")
        expect(page).to have_content "地点登録"
      end
    end
  end
end
