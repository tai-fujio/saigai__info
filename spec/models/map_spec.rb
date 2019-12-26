require 'rails_helper'

RSpec.describe Map, type: :model do
  describe 'バリデーションテスト' do
    it "passwordの非ナル制約テスト" do
      map = Map.new(name:"test",password:nil)
      map.valid?
      expect(map.errors.messages[:password]).to include ("を入力してください")
    end
    it "passwordの文字制約テスト" do
      map = Map.new(name:"test",password:"abcde")
      map.valid?
      expect(map.errors.messages[:password]).to include ("は6文字以上で入力してください")
    end
    it "passwordの文字制約テスト" do
      map = Map.new(name:"test",password:"abcdefghijklmnopqrstuvwxyz")
      map.valid?
      expect(map.errors.messages[:password]).to include ("は20文字以内で入力してください")
    end
    it "nameの非ナル制約テスト" do
      map = Map.new(name:nil,password:"abcdef")
      map.valid?
      expect(map.errors.messages[:name]).to include ("を入力してください")
    end
    it "nameのユニークネステスト" do
      map = Map.create(name:"test__map",password:"abcdef")
      map = Map.new(name:"test__map",password:"abcdef")
      map.valid?
      expect(map.errors.messages[:name]).to include ("はすでに存在します")
    end
    it "createrの文字制限テスト" do
      map = Map.new(name:"test",password:"abcdef",creater:"abcdefghijklmnopqrstuvwxyz,abcdefghijklmnopqrstuvwxyz")
      map.valid?
      expect(map.errors.messages[:creater]).to include ("は40文字以内で入力してください")
    end
  end

  describe "ソートテスト" do
    before do
      @map1 = FactoryBot.create(:map, name: "カキクケコ")
      @map2 = FactoryBot.create(:map, name: "サシスセソ")
      @map3 = FactoryBot.create(:map, name: "アイウエオ")
    end
    it "名前が昇順に並んでいるか" do
      expect(Map.last).to eq(@map2)
      expect(Map.second).to eq(@map3)
    end
  end
end
