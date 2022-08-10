ActiveAdmin.register Page do
  menu priority: 1
  config.batch_actions = false
  include PageAdmin::Form
	include PageAdmin::Index
  include PageAdmin::Controller

  actions :all, except: :new
  before_filter :skip_sidebar!, :only => :index
  
  permit_params :title, :active, :description, :layout, :_destroy,
  components_attributes: [:id, :name, :layout, :description, :position, :url_product, :url_text, :_destroy, attachments_attributes: [:id, :asset, :content_type, :note, :title, :url_product, :url, :_destroy]], # *note add id for disable duplicate when attribute updated
  attachments_attributes: [:id, :asset, :content_type, :note, :title, :_destroy] # *note add id for disable duplicate when attribute updated 
  
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