class ApplicationController < ActionController::Base
  before_action :set_search
  protect_from_forgery with: :exception

  # home,about以外ログイン済ユーザーのみにアクセスを許可する
  before_action :authenticate_user!, except: [:home, :about]

  # deviseコントローラーにストロングパラメータを追加する
  before_action :configure_permitted_parameters, if: :devise_controller?

  #ログイン後、プロフィール画面に移動
  def after_sign_in_path_for(resource)
    top_page_path
  end

  def set_search
    @search = Post.ransack(params[:q]) #ransackの検索メソッド
    @posts = @search.result(distinct: true).order(created_at: "DESC").paginate(page: params[:page], per_page: 5)
  end


  protected
  def configure_permitted_parameters
    # サインアップ時にname birthday genderのストロングパラメータを追加
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :birthday, :gender])
    # アカウント編集の時にnameとintroductionのストロングパラメータを追加
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :introduction])
  end
end
