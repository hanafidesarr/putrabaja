ActiveAdmin.register Category do

  menu priority: 2
  permit_params :id, :name, :short_description, :description, :price,
  children_attributes: [:id, :name, :_destroy]

  config.batch_actions = false
  before_filter :skip_sidebar!, :only => :index
  include CategoryAdmin::Form
  include CategoryAdmin::Index
  include CategoryAdmin::Controller
end