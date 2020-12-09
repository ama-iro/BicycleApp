class UsersController < ApplicationController
  def new
  end

  def show
    @user = User.find(params[:id])
    @age = (Date.today.strftime('%Y%m%d').to_i -
           @user.birthday.strftime('%Y%m%d').to_i) / 10000
  end

  def index
    @user = User.all
  end
end
