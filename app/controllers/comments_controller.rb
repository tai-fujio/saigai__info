class CommentsController < ApplicationController

  def delete
    @comment = Comment.find(params[:id])
    @site = Site.find(@comment.site.id)
    @map = Map.find(@comment.site.map.id)
    if @map.authenticate(params[:password])
      @comment.destroy
      respond_to do |format|
        format.js{render :delete}
      end
    else
      respond_to do |format|
        format.js{render :password_error}
      end
    end
  end

  def new
    @site = Site.find(params[:id])
    @map = Map.find(@site.map.id)
    @comment =@site.comments.build
    respond_to do |format|
      format.js{render :index}
    end
  end

  # def index
  #   @comments = Comment.all
  #   respond_to do |format|
  #     format.js{render :index}
  #   end
  # end

  def create
    @site = Site.find(params[:site_id])
    @map = Map.find(@site.map.id)
    @comment = @site.comments.build(comment_params)
    if @comment.invalid?
      respond_to do |format|
        format.js{render :validation_error and return}
      end
    else
      @comment.save
      @review = Review.new(comment_id: @comment.id)
      @review.save
      respond_to do |format|
        format.js{render :index and return}
      end
    end
  end
  private
  def comment_params
    params.require(:comment).permit(:content,:site_id)
  end
end
