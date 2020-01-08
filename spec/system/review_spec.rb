require 'rails_helper'
require 'selenium-webdriver'
require "rack_session_access/capybara"

RSpec.describe Review, type: :system do
  describe "Review画面" do
    before do
      @map = FactoryBot.create(:map)
      @site = FactoryBot.create(:site,map_id:@map.id)
      @comment = FactoryBot.create(:comment,site_id:@site.id)
      @review = FactoryBot.create(:review,comment_id:@comment.id)
      @key = FactoryBot.create(:key, review_id:@review.id)
    end
    context "reviewをすることができる" do
      it "reviews#count" do 
        page.set_rack_session(session_id: @map.id)
        visit "maps/#{@map.id}/sites/#{@site.id}/comments/new"
        fill_in "comment[content]", with: "テストコメント"
        click_button("コメントする")
        page.execute_script <<~JS
          document.getElementsByClassName("thumbs")[0].text = "test_name";
        JS
        click_on "test_name"
        expect(page.find(".vote",match: :first).text).to eq "1"
      end
    end
  end
end
