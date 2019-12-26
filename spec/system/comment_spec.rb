require 'rails_helper'
require 'selenium-webdriver'

RSpec.describe Comment, type: :system do
  describe "Comment画面" do
    before do
      @map = FactoryBot.create(:map)
      @site = FactoryBot.create(:site,map_id:@map.id)
      @comment = FactoryBot.create(:comment,site_id:@site.id)
      @review = FactoryBot.create(:review,comment_id:@comment.id)
    end
    context "commentsを書き込むことができる" do
      it "comments#create" do
        visit "maps/#{@map.id}/sites/#{@site.id}/comments/new"
        fill_in "comment[content]", with: "テストコメント"
        click_button("コメントする")
        expect(page).to have_content "テストコメント"
      end
    end
    context "commentsを削除することができる" do
      it "comments#delete" do
        visit "maps/#{@map.id}/sites/#{@site.id}/comments/new"
        fill_in "comment[content]", with: "テストコメント"
        click_button("コメントする")
        page.find("#password",match: :first).set("password")
        page.find(".admin_button",match: :first).click
        expect(page).to_not have_content "テストコメント"
      end
    end
  end
end
