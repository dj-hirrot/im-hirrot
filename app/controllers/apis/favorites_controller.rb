class Apis::FavoritesController < ApplicationController
  def create
    @blog = Blog.find(params[:blog_id])
    unless @blog.fav?(current_user)
      @blog.fav(current_user)
      @blog.reload
      logger.debug(request.referrer)
      respond_to do |format|
        format.html { redirect_to request.referrer || root_url }
        format.js
      end
    end
  end

  def destroy
    @blog = Favorite.find(params[:id]).blog
    if @blog.fav?(current_user)
      @blog.un_fav(current_user)
      @blog.reload
      logger.debug(request.referrer)
      respond_to do |format|
        format.html { redirect_to request.referrer || root_url }
        format.js
      end
    end
  end
end
