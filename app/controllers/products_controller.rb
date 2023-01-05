class ProductsController < ApplicationController
  def index
    @page = Page.active.find_by(layout: "products")
  end
  def show
    @page = Page.active.find_by(layout: "products")
    @product = Product.active.find(params[:id])
  end
end