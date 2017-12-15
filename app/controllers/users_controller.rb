class UsersController < ApplicationController

  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update_attributes!(user_params)
      redirect_to user_url, :notice => "會員資料更新成功"
    else
      render :action => :show
    end
  end

  private

  def user_params
    params.require(:user).permit(:avatar, :name, :intro)
  end


end
