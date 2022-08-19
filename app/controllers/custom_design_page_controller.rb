class CustomDesignPageController < ApplicationController
	def index
    @products = Product.active.design
    @product_template = [ ]
    @products.each do |product|
      @product_template << {'title': product.name, 'url': product.images.first&.asset&.url}
    end
	end
end