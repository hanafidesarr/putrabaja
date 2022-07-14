class CategoriesController < ApplicationController

  def show_product
    @category = Category.find(params[:id])
    @products = @category.products
  end
end
