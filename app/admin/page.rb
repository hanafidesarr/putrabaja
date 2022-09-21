ActiveAdmin.register Page do
  menu priority: 1
  config.batch_actions = false
  # include PageAdmin::Form  # this useless because we use sortable
	include PageAdmin::Index
  include PageAdmin::Controller

  actions :all, except: :new
  before_action :skip_sidebar!, :only => :index

  banner_yml = HashWithIndifferentAccess.new(YAML.load_file Rails.root.join('app','views', 'components','banner','banner.yml')) 
  banner_text_yml = HashWithIndifferentAccess.new(YAML.load_file Rails.root.join('app','views', 'components','banner_text','banner_text.yml'))
  categories_products_yml = HashWithIndifferentAccess.new(YAML.load_file Rails.root.join('app','views','components','categories_products','categories_products.yml')) 
  text_base_yml = HashWithIndifferentAccess.new(YAML.load_file Rails.root.join('app','views','components','text_base','text_base.yml'))
  text_image_base_yml = HashWithIndifferentAccess.new(YAML.load_file Rails.root.join('app','views','components','text_image_base','text_image_base.yml'))
  space_yml = HashWithIndifferentAccess.new(YAML.load_file Rails.root.join('app','views','components','space','space.yml'))
  list_images_yml = HashWithIndifferentAccess.new(YAML.load_file Rails.root.join('app','views','components','list_images','list_images.yml'))
  typing_animation_yml = HashWithIndifferentAccess.new(YAML.load_file Rails.root.join('app','views','components','typing_animation','typing_animation.yml'))
  gallery_images_yml = HashWithIndifferentAccess.new(YAML.load_file Rails.root.join('app','views','components','gallery_images','gallery_images.yml'))
  products_by_category_yml = HashWithIndifferentAccess.new(YAML.load_file Rails.root.join('app','views','components','products_by_category','products_by_category.yml'))

  permit_params :title, :active, :description, :layout, :slug, :background_body, :text_body_color, :_destroy,
  components_attributes: [:id, :active, :name, :layout, :description, :position, :url_product, :url_text, :slug, :_destroy,

  banner_yml[:properties], banner_text_yml[:properties], categories_products_yml[:properties], text_base_yml[:properties], text_image_base_yml[:properties], space_yml[:properties],
  list_images_yml[:properties], typing_animation_yml[:properties], gallery_images_yml[:properties], products_by_category_yml[:properties],

  banner_yml[:active_fields], banner_text_yml[:active_fields], categories_products_yml[:active_fields], text_base_yml[:active_fields], text_image_base_yml[:active_fields],
  space_yml[:active_fields], list_images_yml[:active_fields], typing_animation_yml[:active_fields], gallery_images_yml[:active_fields], products_by_category_yml[:active_fields],

  images_attributes: [:id, :active, :asset, :content_type, :note, :title, :url_product, :layout_type, :url, :_destroy]], # *note add id for disable duplicate when attribute updated
  images_attributes: [:id, :active, :asset, :content_type, :note, :title, :layout_type, :_destroy] # *note add id for disable duplicate when attribute updated 
  
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