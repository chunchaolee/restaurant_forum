class CategoriesController < ApplicationController

  def show
      @categore = Category.find(params[:id])
  end


end
