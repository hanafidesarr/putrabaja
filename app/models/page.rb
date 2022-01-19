class Page < ApplicationRecord

  has_ancestry :orphan_strategy => :rootify

  has_many :attachments,  class_name: "Attachment",  as: "parent", dependent: :destroy
  accepts_nested_attributes_for :attachments
end
