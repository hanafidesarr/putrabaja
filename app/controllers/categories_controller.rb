class CategoriesController < ApplicationController

  def index
    @page = Page.active.find_by(layout: "categories")
  end

  def new
    @category = Category.new
  end

  def show
    @page = Page.active.find_by(layout: "categories")
    @category = Category.active.find(params[:id])
    @products = @category.products.page(params[:page]).per(6)
    @category_children = @category.children.page(params[:page]).per(6)
  end
  def show_product
    @category = Category.find(params[:id])
    @products = @category.products.active
  end
end
