ActiveAdmin.register Product do
  permit_params :id, :name, :short_description, :short_description, :description, :price, :category_id, :image_type,
  attachments_attributes: [:id, :asset, :_destroy] 

  include ProductAdmin::Form
  include ProductAdmin::Index
  include ProductAdmin::Controller

  # filter :name
  # filter :short_description
  # filter :description
  # filter :price

end