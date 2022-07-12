class CategoriesController < ApplicationController

  def show_product
    @page = Category.find(params[:id])
    @products = @page.products
  end
end
