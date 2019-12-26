class CommentsController < ApplicationController

  def delete
    @comment = Comment.find(params[:id])
    @site = Site.find(@comment.site.id)
    @map = Map.find(@comment.site.map.id)
    if @map.authenticate(params[:password])
      @comment.destroy
      respond_to do |format|
        format.js{render :delete}
        format.html{render partial: "comments/index",locals: {
          site:@site,comments:@comments,review:@review}}
      end
    else
      respond_to do |format|
        format.js{render :password_error}
      end
    end
  end

  def new
    unless params[:id]
      @site = Site.find(params[:site_id])
    else
      @site = Site.find(params[:id])
    end
      @map = Map.find(@site.map.id)
      @comment =@site.comments.build
    respond_to do |format|
      format.js{render :index}
      format.html{render partial: "comments/new",locals: { site:@site, map:@map, comment:@comment, review:@review }}
    end
  end

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
        format.html{render partial: "comments/index",locals: { site:@site ,comments:@site.comments}}
      end
    end
  end
  private
  def comment_params
    params.require(:comment).permit(:content,:site_id)
  end
end
