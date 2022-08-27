class Component < ApplicationRecord

  # scoped area
  default_scope { order(:position) }
  scope :active, -> { where(active: true) }

  # association area
  belongs_to :page
  has_many :images, class_name: "Image", as: "parent", dependent: :destroy

  # nested attribute form
  accepts_nested_attributes_for :images, allow_destroy: true

  # this method for sortable drag position model of component
  acts_as_list scope: :page

  # this collection layout
  #needfix
  #move to yaml file , and set must dynamic
  COMPONENT_LAYOUT=["banner", "banner_text","categories_products","text_base","text_image_base","text_product_base"]
  store :properties, coder: JSON
  after_initialize :add_accessors_for_content_attributes, if: -> { self.layout.present? }

  def add_accessors_for_content_attributes
    component_yml = HashWithIndifferentAccess.new(YAML.load_file Rails.root.join("app","views", "components","#{self.layout}","#{self.layout}.yml"))
    singleton_class.class_eval do
      store_accessor :properties, component_yml[:properties]
      store_accessor :properties, component_yml[:active_fields]
    end
  end

end
