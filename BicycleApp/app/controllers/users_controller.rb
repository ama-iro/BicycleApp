class UsersController < ApplicationController
  def new
  end

  def show
    @user = current_user
    @age = (Date.today.strftime('%Y%m%d').to_i -
           @user.birthday.strftime('%Y%m%d').to_i) / 10000
  end

  def index
  end
end
