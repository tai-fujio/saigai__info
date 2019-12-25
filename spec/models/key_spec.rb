require 'rails_helper'

RSpec.describe Key, type: :model do
  before do
    @map = FactoryBot.create(:map)
    @site = FactoryBot.create(:site,map_id:@map.id)
    @comment = FactoryBot.create(:comment,site_id:@site.id)
    @review = FactoryBot.create(:review,comment_id:@comment.id)
    @key = FactoryBot.create(:key,review_id:@review.id)
  end
  describe 'バリデーションテスト' do
    it "value非ナル制約テスト" do
      @key.value = nil
      @key.valid?
      expect(@key.errors.messages[:value]).to include ("を入力してください")
    end
    it "KeyとReviewの組み合わせユニークテスト" do
      key1 = Key.new(value:"123456789",review_id:@review.id)
      key2 = Key.new(value:"1234567890",review_id:@review.id)
      key2.valid?
      expect(key1.valid?).to eq true
      expect(key2.errors.messages[:value]).to include ("はすでに存在します")
    end
  end
end
