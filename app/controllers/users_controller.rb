class UsersController < ApplicationController
  before_action :is_matching_login_user, only: [:edit, :update]

  def index
    @users = User.all
  end

  def show
    #@book = Book.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to  user_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :image, :introduction)
  end
end
