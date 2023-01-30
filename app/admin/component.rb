ActiveAdmin.register Component do

  include ComponentAdmin::Controller

  menu false
  permit_params :email, :password, :password_confirmation,
  images_attributes: [:id, :asset, :content_type, :note, :title, :layout, :description, :_destroy]




end
  