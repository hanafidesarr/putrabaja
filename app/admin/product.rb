ActiveAdmin.register Product do

  menu priority: 3
  permit_params :id, :sku, :name, :short_description, :short_description, :description, :price, :discount, :category_id, :image_type,:battery_life, :model, :processor, :memory, :hard_drive, :vga, :display_type, :os, :optical_drive, :warranty, :wireless, :bluetooth, :other,
  images_attributes: [:id, :asset, :_destroy] 

  # before_filter :skip_sidebar!, :only => :index
  
  include ProductAdmin::Form
  include ProductAdmin::Index
  include ProductAdmin::Controller

  # filter :name
  # filter :short_description
  # filter :description
  # filter :price

  sortable tree: true,
  max_levels: 0,               # infinite indent levels
  protect_root: false,         # allow root items to be dragged
  sorting_attribute: :position,
  parent_method: :parent,
  children_method: :children,
  roots_method: :roots,
  roots_collection: nil,       # proc to specifiy retrieval of roots
  sortable: true,              # Disable sorting (use only 'tree' functionality)
  collapsible: false,          # show +/- buttons to collapse children
  start_collapsed: false       # when collapsible, start with all roots collapsed
end