require 'rails_helper'

RSpec.describe Review, type: :model do
  before do
    @map = FactoryBot.create(:map)
    @site = FactoryBot.create(:site,map_id:@map.id)
    @comment = FactoryBot.create(:comment,site_id:@site.id)
  end
  describe 'アソシエーションテスト' do
    it "has_oneテスト" do
      @review = FactoryBot.create(:review,comment_id: @comment.id)
      @review2 = FactoryBot.create(:review,comment_id: @comment.id)
      expect(@comment.review).to eq @review
    end
  end
end
