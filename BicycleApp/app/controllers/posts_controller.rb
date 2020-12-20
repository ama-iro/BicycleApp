class PostsController < ApplicationController
before_action :correct_user, only: [:edit, :update]

  def new
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
  end

  def create
    @post = current_user.post.build(post_params)
    if @post.save
      flash[:notice] = "料理が登録されました！"
      redirect_to post_path(@post)
    else
      render 'posts/new'
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(post_params)
      flash[:notice] = "料理情報が更新されました！"
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
      flash[:alert] = "他人の料理は削除できません"
      redirect_to root_url
    end
  end

  private

    def post_params
      params.require(:post).permit(:title, :description, :area, :place, :required_time, :picture)
    end

    def correct_user
      @post = current_user.post.find_by(id: params[:id])
      redirect_to root_url if @post.nil?
    end
end
