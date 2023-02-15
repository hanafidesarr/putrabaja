ActiveAdmin.register Category do

  menu priority: 2
  permit_params :id, :active, :name, :short_description, :description, :price, :layout,
  children_attributes: [:id, :name, :_destroy],
  images_attributes: [:id, :title, :url, :note, :asset, :active, :layout_type, :alt, :image_quality, :background_image_size, :background_image_position, :background_image_color, :price, :series, :url_image, :width, :height, :class_image, :style_image, :subtitle, :url_image_thumb, :_destroy] 

  # config.batch_actions = false
  before_action :skip_sidebar!, :only => :index
  include CategoryAdmin::Form
  include CategoryAdmin::Index
  include CategoryAdmin::Controller

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