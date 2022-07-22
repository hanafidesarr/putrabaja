class Component < ApplicationRecord

  default_scope { order(:position) }
  # attachment
  has_many :attachments,  class_name: "Attachment",  as: "parent", dependent: :destroy
  accepts_nested_attributes_for :attachments, :allow_destroy => true
  belongs_to :page

  COMPONENT_LAYOUT=["banner","banner_full","custom_categories_products","text_base","text_image_base","text_maqruee_base","text_product_base"]
end
