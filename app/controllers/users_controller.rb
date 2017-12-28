class UsersController < ApplicationController

  before_action :set_user, only: [:show, :edit, :update]

  def index
    @users = User.all
  end

  def show
    # set_user
    # 多對多關聯資料
    @commented_restaurants = @user.restaurants.uniq

  end

  def edit
    # set_user
  end

  def update
    # set_user
    if @user == current_user 
      if @user.update_attributes(user_params)
        redirect_to user_url, :notice => "會員資料更新成功"
      else
        render :action => :edit
      end
    else
      redirect_to user_path(@user), :alert => "NOT ALLOW"
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:avatar, :name, :intro)
  end


end
