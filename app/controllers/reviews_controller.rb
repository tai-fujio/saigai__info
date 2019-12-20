class ReviewsController < ApplicationController
  def count
    @comment = Comment.find(params[:format])
    @site = Site.find(@comment.site_id)
    @review = Review.find(@comment.review.id)
    @comments = @site.comments
    if params[:key] == "good"
      @review.increment(:good)
      @key = Key.new(value: session[:session_id])
      @key.review_id = @review.id
    elsif params[:key] == "bad"
      @review.increment(:bad)
      @key = Key.new(value: session[:session_id])
      @key.review_id = @vote.id
    end
    if @key.valid?
      @review.save
      @key.save
    else
      flash.now[:notice] = "評価できません"
    end
    # session[:session_id]
    # respond_to do |format|
    # format.html {flash.now[:notice]="!!!"}
    # format.js{render :count}
    # format.js{'vote_review.js.erb'}
    # end
  end
end
