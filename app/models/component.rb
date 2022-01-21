class Component < ApplicationRecord

  # attachment
  has_many :attachments,  class_name: "Attachment",  as: "parent", dependent: :destroy
  accepts_nested_attributes_for :attachments
end
