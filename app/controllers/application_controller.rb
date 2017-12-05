class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # RestaurantsController, Admin::CategoriesController, Admin::RestaurantsController
  before_action :authenticate_user!

end
