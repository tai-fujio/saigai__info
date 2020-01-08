class ReviewsController < ApplicationController

  def count
    @comment = Comment.find(params[:comment_id])
    @review = Review.find(@comment.review.id)
    @site = Site.find(@comment.site.id)

    if params[:key] == "good"
      @review.increment(:good)
      @key = Key.new(value: session[:session_id])
      @key.review_id = @review.id
    elsif params[:key] == "bad"
      @review.increment(:bad)
      @key = Key.new(value: session[:session_id])
      @key.review_id = @review.id
    end

    if @key.invalid?
      respond_to do |format|
        format.js{render :validation_error}
      end
    else
      @review.save
      @key.save
      respond_to do |format|
        format.js{render :show}
        format.html{render partial: "comments/index",locals: {
          site:@site,comments:@comments,review:@review}}
      end
    end
  end
end
