ActiveAdmin.register Product do

  menu priority: 3
  permit_params :id, :sku, :name, :short_description, :short_description, :description, :price, :discount, :category_id, :image_type,
  attachments_attributes: [:id, :asset, :_destroy] 

  before_filter :skip_sidebar!, :only => :index
  
  include ProductAdmin::Form
  include ProductAdmin::Index
  include ProductAdmin::Controller

  # filter :name
  # filter :short_description
  # filter :description
  # filter :price

end