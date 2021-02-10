class PostsController < ApplicationController
before_action :correct_user, only: [:edit, :update]

  def new
    @post = Post.new
    @post.images.build
  end

  def show
    @post = Post.find(params[:id])
    @user = User.find(@post.user_id)
    @images = Image.where(@post.id.to_s)
    @comment = Comment.new
    @comment_count = Comment.where(post_id: @post.id).count
    @favorite = Favorite.where(post_id: @post.id).count
    @comment_user = User.find(current_user.id)
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:notice] = "投稿しました！"
      redirect_to post_path(@post)
    else
      render 'posts/new'
    end
  end

  def edit
    @post = Post.find(params[:id])
    @post.images.build
  end

  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(post_params)
      flash[:notice] = "投稿が更新されました！"
      redirect_to @post
    else
      render 'posts/edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    if current_user.admin? || current_user.id = @post.user_id
      @post.destroy
      flash[:notice] = "投稿が削除されました"
      redirect_to root_url
    else
      flash[:alert] = "他人の投稿は削除できません"
      redirect_to root_url
    end
  end

  private

    def post_params
      params.require(:post)
      .permit(:title,
              :description,
              :area,
              :place,
              :required_time,
              images_attributes: [
                :id,
                :image_url,
                :post_id])
      .merge(user_id: current_user.id)

    end

    def correct_user
      @post = current_user.posts.find_by(id: params[:id])
      redirect_to root_url if @post.nil?
    end
end
