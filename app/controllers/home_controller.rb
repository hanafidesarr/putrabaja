class HomeController < ApplicationController
  require 'base64'
  skip_before_action :verify_authenticity_token

  def index
    @products = Product.active.normal
    @page = Page.find_by(layout: "home")

    @components = @page&.components.active if @page&.components.present?
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
