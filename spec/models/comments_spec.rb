require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
    @map = FactoryBot.create(:map)
    @site = FactoryBot.create(:site,map_id:@map.id)
    @comment = FactoryBot.create(:comment,site_id:@site.id)
  end
  describe 'バリデーションテスト' do
    it "content非ナル制約テスト" do
      comment = Comment.new(content: nil)
      comment.valid?
      expect(comment.errors.messages[:content]).to include ("を入力してください")
    end
    it "content文字数制約テスト" do
      comment = Comment.new(content: "abcdefghijklmnopqrstuvwxyz,abcdefghijklmnopqrstuvwxyz,abcdefghijklmnopqrstuvwxyz,abcdefghijklmnopqrstuvwxyz,abcdefghijklmnopqrstuvwxyz,abcdefghijklmnopqrstuvwxyz,abcdefghijklmnopqrstuvwxyz,abcdefghijklmnopqrstuvwxyz")
      comment.valid?
      expect(comment.errors.messages[:content]).to include ("は140文字以内で入力してください")
    end
  end
  describe "ソートテスト" do
    before do
      @comment1 = FactoryBot.create(:comment,site_id:@site.id)
      @comment2 = FactoryBot.create(:comment,site_id:@site.id)
      @comment3 = FactoryBot.create(:comment,site_id:@site.id)
    end
    it "コメントが時間の降順に並んでいるか" do
      expect(Comment.first).to eq(@comment3)
      expect(Comment.second).to eq(@comment2)
      expect(Comment.third).to eq(@comment1)
    end
  end
end
