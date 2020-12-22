class FavoritesController < ApplicationController

  def create
    @favorite = Favorite.new(
      user_id: current_user.id,
      post_id: params[:post_id]
    )
    @favorite.save
    redirect_to("/posts/#{params[:post_id]}")
  end

  def destroy
    @favorite = Favorite.find_by(
      user_id: current_user.id,
      post_id: params[:post_id]
    )
    @favorite.destroy
    redirect_to("/posts/#{params[:post_id]}")
  end

  def index
    @favorites = current_user.favorites
  end
end
