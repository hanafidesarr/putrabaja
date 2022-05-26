class Product < ApplicationRecord
  belongs_to :category
  has_many :attachments,  class_name: "Attachment",  as: "parent", dependent: :destroy

  accepts_nested_attributes_for :attachments, :allow_destroy => true

  scope :design, -> { where("image_type = ?", 1) }

  # Enum 0..5          0,       1,
  enum image_type: [:normal, :design]
end
