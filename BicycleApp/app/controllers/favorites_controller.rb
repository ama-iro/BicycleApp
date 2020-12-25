class FavoritesController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @user = @post.user
    @favorite = Favorite.new(
      user_id: current_user.id,
      post_id: params[:post_id]
    )
    @favorite.save
    redirect_to("/posts/#{params[:post_id]}")

    # 自分以外のユーザーからお気に入り登録があったときのみ通知を作成
    if @user != current_user
      @user.notifications.create(post_id: @post.id, variety: 1,
                                 from_user_id: current_user.id)
      @user.update_attribute(:notification, true)
    end
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
