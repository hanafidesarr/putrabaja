ActiveAdmin.register Category do

  permit_params :id, :name, :short_description, :description, :price

  config.batch_actions = false
  before_filter :skip_sidebar!, :only => :index
  include CategoryAdmin::Form
  include CategoryAdmin::Index
  include CategoryAdmin::Controller
end