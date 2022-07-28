class ProductsController < ApplicationController
  def index
    @page = Page.find_by(layout: "products")
  end
  def show
    @product = Product.find(params[:id])
  end
end