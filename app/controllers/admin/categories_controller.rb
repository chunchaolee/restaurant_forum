class Admin::CategoriesController < ApplicationController

  befor_action :authenticate_user!
  befor_action :authenticate_admin?

end
