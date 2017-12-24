class RestaurantsController < ApplicationController

  before_action :set_restaurant, only: [:show, :dashboard, :favorite, :unfavorite, :like, :unlike]
  # 認證 > ApplicationController

  def index
    @categories = Category.all
    @restaurants = Restaurant.page(params[:page]).per(9)
  end

  def show
    # set_restaurant before action
    @comment = Comment.new
  end

  def feed
    @recent_restaurants = Restaurant.order(created_at: :desc).limit(10)
    @recent_comments = Comment.order(created_at: :desc).limit(10)
  end

  def dashboard
    # set_restaurant before action
  end

  def favorite
    # set_restaurant before action
    @restaurant.favorites.create!(user: current_user)
    save_favorites_count
    redirect_back(fallback_location: root_path)
  end

  def unfavorite
    # set_restaurant before action
    favorites = Favorite.where(restaurant: @restaurant, user: current_user)
    favorites.destroy_all
    save_favorites_count
    redirect_back(fallback_location: root_path)
  end

  def like
    # set_restaurant before action
    @restaurant.likes.create!(user: current_user)
    redirect_back(fallback_location: root_path)
  end

  def unlike
    # set_restaurant before action
    likes = Like.where(restaurant: @restaurant, user: current_user)
    likes.destroy_all
    redirect_back(fallback_location: root_path)
  end

  



  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  def save_favorites_count
    @restaurant.favorites_count = @restaurant.favorited_users.count
    @restaurant.save!
  end

end



