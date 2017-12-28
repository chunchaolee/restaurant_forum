class FriendshipsController < ApplicationController

  def create
    @friendship = current_user.friendships.build(friend_id: params[:friend_id])

    if @friendship.save
      flash[:notice] = "成功成為朋友！"
      redirect_back(fallback_location: root_path)
    else
      flash[:alert] = "已為好友"
      redirect_back(fallback_location: root_path)
    end
  end

end
