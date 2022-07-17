class Page < ApplicationRecord

  has_ancestry :orphan_strategy => :rootify

  # attachment
  has_many :attachments,  class_name: "Attachment",  as: "parent", dependent: :destroy
  accepts_nested_attributes_for :attachments, :allow_destroy => true

  # association
  has_many :components, dependent: :destroy
  accepts_nested_attributes_for :components

  scope :active, -> { where(active:true) }
  scope :root_page, -> { select{|page| page.is_root? } }

  PAGE_LAYOUT=["home","categories","products"]
end
