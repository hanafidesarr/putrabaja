ActiveAdmin.register Page do
  menu priority: 1
  config.batch_actions = false
  # include PageAdmin::Form  # this useless because we use sortable
	include PageAdmin::Index
  include PageAdmin::Controller
  include PageAdmin::Form

  actions :all
  before_action :skip_sidebar!, :only => :index

  banner_yml = HashWithIndifferentAccess.new(YAML.load_file Rails.root.join('app','views', 'components','banner','banner.yml')) 
  custom_component_yml = HashWithIndifferentAccess.new(YAML.load_file Rails.root.join('app','views', 'components','custom_component','custom_component.yml')) 
  banner_slick_yml = HashWithIndifferentAccess.new(YAML.load_file Rails.root.join('app','views', 'components','banner_slick','banner_slick.yml')) 
  banner_text_yml = HashWithIndifferentAccess.new(YAML.load_file Rails.root.join('app','views', 'components','banner_text','banner_text.yml'))
  categories_products_yml = HashWithIndifferentAccess.new(YAML.load_file Rails.root.join('app','views','components','categories_products','categories_products.yml')) 
  text_base_yml = HashWithIndifferentAccess.new(YAML.load_file Rails.root.join('app','views','components','text_base','text_base.yml'))
  text_image_base_yml = HashWithIndifferentAccess.new(YAML.load_file Rails.root.join('app','views','components','text_image_base','text_image_base.yml'))
  space_yml = HashWithIndifferentAccess.new(YAML.load_file Rails.root.join('app','views','components','space','space.yml'))
  list_images_yml = HashWithIndifferentAccess.new(YAML.load_file Rails.root.join('app','views','components','list_images','list_images.yml'))
  list_images_slider_yml = HashWithIndifferentAccess.new(YAML.load_file Rails.root.join('app','views','components','list_images_slider','list_images_slider.yml'))
  typing_animation_yml = HashWithIndifferentAccess.new(YAML.load_file Rails.root.join('app','views','components','typing_animation','typing_animation.yml'))
  gallery_images_yml = HashWithIndifferentAccess.new(YAML.load_file Rails.root.join('app','views','components','gallery_images','gallery_images.yml'))
  products_by_category_yml = HashWithIndifferentAccess.new(YAML.load_file Rails.root.join('app','views','components','products_by_category','products_by_category.yml'))
  vertical_carousel_frame_yml = HashWithIndifferentAccess.new(YAML.load_file Rails.root.join('app','views','components','vertical_carousel_frame','vertical_carousel_frame.yml'))
  split_product_showcase_yml = HashWithIndifferentAccess.new(YAML.load_file Rails.root.join('app','views','components','split_product_showcase','split_product_showcase.yml'))
  modern_slide_in_yml = HashWithIndifferentAccess.new(YAML.load_file Rails.root.join('app','views', 'components','modern_slide_in','modern_slide_in.yml'))
  banner_flip_effects_rocket_yml = HashWithIndifferentAccess.new(YAML.load_file Rails.root.join('app','views', 'components','banner_flip_effects_rocket','banner_flip_effects_rocket.yml'))
  wave_liquid_animation_yml = HashWithIndifferentAccess.new(YAML.load_file Rails.root.join('app','views', 'components','wave_liquid_animation','wave_liquid_animation.yml'))
  slick_slider_multiple_yml = HashWithIndifferentAccess.new(YAML.load_file Rails.root.join('app','views','components','slick_slider_multiple','slick_slider_multiple.yml'))
  subscribe_form_yml = HashWithIndifferentAccess.new(YAML.load_file Rails.root.join('app','views', 'components','subscribe_form','subscribe_form.yml'))
  subscribe_form_modal_yml = HashWithIndifferentAccess.new(YAML.load_file Rails.root.join('app','views', 'components','subscribe_form_modal','subscribe_form_modal.yml'))
  slide_reveal_yml = HashWithIndifferentAccess.new(YAML.load_file Rails.root.join('app','views','components','slide_reveal','slide_reveal.yml'))
  annotation_scalize = HashWithIndifferentAccess.new(YAML.load_file Rails.root.join('app','views','components','annotation_scalize','annotation_scalize.yml'))
  
  nav_list_horizontal = HashWithIndifferentAccess.new(YAML.load_file Rails.root.join('app','views','components','annotation_scalize','annotation_scalize.yml'))
  image_and_save_image = HashWithIndifferentAccess.new(YAML.load_file Rails.root.join('app','views','components','image_and_save_image','image_and_save_image.yml'))

  permit_params :title, :active, :description, :layout, :slug, :show_title, :background_body_color, :text_body_color, :body_layout, :template, :_destroy, Page.stored_attributes[:header_desktop_properties], Page.stored_attributes[:header_mobile_properties], Page.stored_attributes[:seo_page_properties], Page.stored_attributes[:footer], Page.globalize_attribute_names,
  
  components_attributes: [:id, :active, :name, :layout, :description, :position, :url_product, :url_text, :slug, Component.globalize_attribute_names, :_destroy,

  banner_yml[:properties], banner_slick_yml[:properties], custom_component_yml[:properties], banner_text_yml[:properties], categories_products_yml[:properties], text_base_yml[:properties], text_image_base_yml[:properties], space_yml[:properties],
  list_images_yml[:properties], list_images_slider_yml[:properties], typing_animation_yml[:properties], gallery_images_yml[:properties], products_by_category_yml[:properties], vertical_carousel_frame_yml[:properties],
  split_product_showcase_yml[:properties], modern_slide_in_yml[:properties], banner_flip_effects_rocket_yml[:properties], wave_liquid_animation_yml[:properties],  wave_liquid_animation_yml[:properties], slick_slider_multiple_yml[:properties],
  subscribe_form_yml[:properties], subscribe_form_modal_yml[:properties], slide_reveal_yml[:properties], annotation_scalize[:properties], nav_list_horizontal[:properties], image_and_save_image[:properties],

  banner_yml[:active_fields], banner_slick_yml[:active_fields], custom_component_yml[:yml], banner_text_yml[:active_fields], categories_products_yml[:active_fields], text_base_yml[:active_fields], text_image_base_yml[:active_fields],
  space_yml[:active_fields], list_images_yml[:active_fields], list_images_slider_yml[:active_fields], typing_animation_yml[:active_fields], gallery_images_yml[:active_fields], products_by_category_yml[:active_fields],
  vertical_carousel_frame_yml[:active_fields],split_product_showcase_yml[:active_fields], modern_slide_in_yml[:active_fields], banner_flip_effects_rocket_yml[:active_fields], wave_liquid_animation_yml[:active_fields],
  slick_slider_multiple_yml[:active_fields], subscribe_form_yml[:active_fields], subscribe_form_modal_yml[:active_fields], slide_reveal_yml[:active_fields], annotation_scalize[:active_fields], nav_list_horizontal[:active_fields],
  image_and_save_image[:active_fields],

  images_attributes: [:id, :active, :asset, :content_type, :note, :title, :subtitle, :url_product, :layout_type, :image_quality, :background_image_size, :background_image_position, :background_image_color, :background_image_repeat, :url, :url_image, :url_image_thumb, :price, :series, :alt, :width, :height, :class_image, :position, :style_image, :group_list, Image.globalize_attribute_names, :_destroy]


  ], # *note add id for disable duplicate when attribute updated

  images_attributes: [:id, :active, :asset, :content_type, :note, :title, :subtitle, :layout_type, :image_quality, :background_image_size, :background_image_position, :background_image_color, :background_image_repeat, :url_image, :url_image_thumb, :price, :series, :width, :height, :class_image, :style_image, :position, :group_list, Image.globalize_attribute_names, :_destroy] # *note add id for disable duplicate when attribute updated 
  
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