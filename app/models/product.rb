class Product < ApplicationRecord
  belongs_to :category
  has_many :attachments,  class_name: "Attachment",  as: "parent", dependent: :destroy

  accepts_nested_attributes_for :attachments, :allow_destroy => true
end
