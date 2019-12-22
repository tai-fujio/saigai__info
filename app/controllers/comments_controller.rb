class CommentsController < ApplicationController
  
  def new
    @site = Site.find(params[:id])
    @map = Map.find(@site.map_id)
    @comment =@site.comments.build
    respond_to do |format|
      format.js{render :index}
    end
  end
  
  def index
    # @site = Site.find(params[:id])
    @comments = Comment.all
    # head :no_content
    respond_to do |format|
      format.js{render :index}
    end
  end

  def create
    # @site = Site.find(params[:id])
    @map = Map.find(params[:map_id])
    @site = Site.find(params[:site_id])
    @comment = @site.comments.build(comment_params)
    if
      @comment.save
      @review = Review.new(comment_id: @comment.id)
      @review.save
    end
    respond_to do |format|
      format.js{render :index }
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:content,:site_id)
  end
end
