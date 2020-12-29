class StaticPagesController < ApplicationController
  before_action :set_search, only: [:index, :show]

  def home
  end

  def about
  end

  def terms
  end

  def top_page
    @search = Post.ransack(params[:q]) #ransackの検索メソッド
    @posts = @search.result(distinct: true).order(created_at: "DESC").paginate(page: params[:page], per_page: 5)
  end

  def search
    @search = Post.ransack(params[:q]) #ransackの検索メソッド
    @posts = @search.result(distinct: true).order(created_at: "DESC").paginate(page: params[:page], per_page: 5)
  end


end
