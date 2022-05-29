ActiveAdmin.register Page do

  config.batch_actions = false
  include PageAdmin::Form
	include PageAdmin::Index
  include PageAdmin::Controller

  before_filter :skip_sidebar!, :only => :index
  
  permit_params :title, :active, :_destroy,
  components_attributes: [:id, :name, :_destroy, attachments_attributes: [:id, :asset, :content_type, :note, :title, :layout, :description, :_destroy]], # *note add id for disable duplicate when attribute updated
  attachments_attributes: [:id, :asset, :content_type, :note, :title, :layout, :description, :_destroy] # *note add id for disable duplicate when attribute updated 
  
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
            start_collapsed: false      # when collapsible, start with all roots collapsed

end