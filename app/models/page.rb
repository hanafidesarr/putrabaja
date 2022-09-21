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

  after_validation :set_slug, only: [:create, :update]

  store :properties, accessors: [ :background_body, :text_body_color ], coder: JSON

  def to_param
    "#{id}-#{slug}"
  end
  
  private
  def set_slug
    self.slug = self.slug.present? ? self.slug.to_s.parameterize : self.title
  end
end
