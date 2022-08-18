class Page < ApplicationRecord

  has_ancestry :orphan_strategy => :rootify

  # images relation
  has_many :images, class_name: "Image",  as: "parent", dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true

  # association
  has_many :components, dependent: :destroy
  accepts_nested_attributes_for :components

  # scope
  scope :active, -> { where(active:true) }
  scope :root_page, -> { select{|page| page.is_root? } }

  PAGE_LAYOUT=["home","categories","products", "page"]

end
