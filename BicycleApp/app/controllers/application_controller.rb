class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # home,about以外ログイン済ユーザーのみにアクセスを許可する
  before_action :authenticate_user!, except: [:home, :about]

  # deviseコントローラーにストロングパラメータを追加する
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  def configure_permitted_parameters
    # サインアップ時にname birthday genderのストロングパラメータを追加
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :birthday, :gender])
    # アカウント編集の時にnameとintroductionのストロングパラメータを追加
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :introduction])
  end
end
