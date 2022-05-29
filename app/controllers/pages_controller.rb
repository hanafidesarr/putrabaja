class PagesController < ApplicationController
	def show
		@page = Page.find(params[:id])

    @products = Product.normal
    @product_template = [ ]
    @products.each do |product|
      @product_template << {'title': product.name, 'url': product.attachments.first.asset.url}
    end

	end
end
