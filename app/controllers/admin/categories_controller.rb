class Admin::CategoriesController < ApplicationController

  # before_action :authenticate_user! > ApplicationController
  before_action :authenticate_admin
  before_action :set_category, only: [:update, :destroy]

  def index
    @categories = Category.all

    if params[:id]
      set_category
    else
      @category = Category.new
    end

  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to admin_categories_path, :notice => "Category 建立成功！"
    else
      @categories = Category.all
      render :index
    end
  end

  def update
    # set_category
    @category.update(category_params)

    if @category.save
      redirect_to admin_categories_path, :notice => "Category Update成功！"
    else
      @categories = Category.all
      render :index
    end

  end

  def destroy
    # set_category
    @category.destroy
    redirect_to admin_categories_path, :notice => "Category 刪除成功！"

  end


  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name)
  end


end
