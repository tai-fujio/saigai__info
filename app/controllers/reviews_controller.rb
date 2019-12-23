class ReviewsController < ApplicationController
  protect_from_forgery except: [:count]
  def count
    @comment = Comment.find(params[:id])
    @review = Review.find(@comment.review.id)
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
      end
    end
    # if @comment.invalid?
    #   respond_to do |format|
    #     format.js{render :validation_error and return}
    #   end
    # else
    #   @comment.save
    #   @review = Review.new(comment_id: @comment.id)
    #   @review.save
    # end
    # respond_to do |format|
    #   format.js{render :index }
    # end
    # session[:session_id]
    # respond_to do |format|
    # format.html {flash.now[:notice]="!!!"}
    # format.js{render :count}
    # format.js{'vote_review.js.erb'}
    # end
  end
end
