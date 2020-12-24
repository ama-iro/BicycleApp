class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @user = @post.user
    @comment = @post.comments.build(user_id: current_user.id,
                                             content: params[:comment][:content])
    if !@post.nil? && @comment.save
      flash[:notice] = "コメントを追加しました！"
    else
      flash[:alert] = "空のコメントは投稿できません。"
    end
    redirect_to root_url
  end

  def destroy
    @comment = Comment.find(params[:id])
    @post = @comment.post
    if current_user.id == @comment.user_id
      @comment.destroy
      flash[:notice] = "コメントを削除しました"
    end
    redirect_to post_path(@post)
  end
end
