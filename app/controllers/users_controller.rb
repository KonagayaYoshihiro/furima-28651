class UsersController < ApplicationController
  def index
    redirect_to root_path
  end

  def new
    @user = User.new
  end

  def edit
  end

  def destroy
    redirect_to root_path
  end
end
