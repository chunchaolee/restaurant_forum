class UsersController < ApplicationController

  before_action :set_user, only: [:show, :edit, :update]

  def show
    # set_user

  end

  def edit
    # set_user
  end

  def update
    # set_user
    if @user.update_attributes(user_params)
      redirect_to user_url, :notice => "會員資料更新成功"
    else
      render :action => :edit
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
