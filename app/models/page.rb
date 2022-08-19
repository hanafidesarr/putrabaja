class Page < ApplicationRecord

  # scoped area
  scope :active, -> { where(active:true) }
  scope :root_page, -> { select{|page| page.is_root? } }
  has_ancestry :orphan_strategy => :rootify

  # association area
  has_many :components, dependent: :destroy
  has_many :images, class_name: "Image",  as: "parent", dependent: :destroy

  # nested attribute form
  accepts_nested_attributes_for :components
  accepts_nested_attributes_for :images, allow_destroy: true


  PAGE_LAYOUT=["home","categories","products", "page"]

end
