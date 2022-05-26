class CustomDesignPageController < ApplicationController
	def index
    @products = Product.design
    @product_template = [ ]
    @products.each do |product|
      @product_template << {'title': product.name, 'url': product.attachments.first.asset.url}
    end
	end
end