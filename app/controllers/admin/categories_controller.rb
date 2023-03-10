class Admin::CategoriesController < ApplicationController
  def index
    @category = Category.new
    @categories = Category.all
  end

  def create
    @category = Category.new(category_params)
    @categories = Category.all
    if @category.save
      redirect_to admin_categories_path(@category.id)
    else
      render:index
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update(category_params)
      redirect_to admin_categories_path(@category.id)
    else
      render:edit
    end
  end


  private
  def category_params
    params.require(:category).permit(:name)
  end
end
