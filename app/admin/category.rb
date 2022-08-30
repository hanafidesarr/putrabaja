ActiveAdmin.register Category do

  menu priority: 2
  permit_params :id, :name, :short_description, :description, :price,
  children_attributes: [:id, :name, :_destroy]

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