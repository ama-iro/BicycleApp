# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]

  def destroy_user
    @user = User.find(params[:id])

    if current_user.admin?
      @user.destroy
      flash[:notice] = "ユーザーの削除に成功しました"
      redirect_to root_path
    else
      flash[:alert] = "他人のアカウントは削除できません"
      redirect_to root_path
    end
  end

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  # def create
  #   super
  # end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy_use

  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end


  protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :birthday, :gender])
  end

  # If you have extra params to permit, append them to the sanitizer.
  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :birthday, :gender])
  end

  def update_resource(resource, params)
    resource.update_without_password(params)
  end

  # アカウント編集後、プロフィール画面に移動する
  def after_update_path_for(resource)
    "/users/show/#{current_user.id}"
  end

  # アカウント登録後、プロフィール画面に移動する
  def after_sign_up_path_for(resource)
    "/users/show/#{current_user.id}"
  end


  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
