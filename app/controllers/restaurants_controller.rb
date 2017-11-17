class RestaurantsController < ApplicationController

  # 認證
  before_action :authenticate_user!

  def index

  end

end
