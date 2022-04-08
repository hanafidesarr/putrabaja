class HomeController < ApplicationController
  require 'base64'

  skip_before_action :verify_authenticity_token

  def index
    @products = Product.all
    @product_template = [ ]
    @products.each do |product|
      @product_template << {'title': product.name, 'url': product.attachments.first.asset.url}
    end

  end

  def custom_design
    canvas_image =  params[:amm_canvas]
    image_data = Base64.decode64(canvas_image['data:image/png;base64,'.length .. -1])
    @name_image = "name-id-#{Time.now.to_i}.png"
    File.open("#{Rails.root}/public/#{@name_image}", 'wb') do |f|
      f.write image_data
    end
  end

end
