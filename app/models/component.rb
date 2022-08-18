class Component < ApplicationRecord

  # scoped area
  default_scope { order(:position) }

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
  COMPONENT_LAYOUT=["banner","banner_full","custom_categories_products","text_base","text_image_base","text_maqruee_base","text_product_base"]

end
