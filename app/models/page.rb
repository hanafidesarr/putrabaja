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

  store :properties, accessors: [ :show_title, :background_body_image, :background_body_color, :text_body_color, :body_layout ], coder: JSON
  store :header_desktop_properties, accessors: [ :layout_desktop, :position_desktop, :background_color_desktop, :text_color_desktop, :font_family_desktop, :font_size_desktop ], coder: JSON
  store :header_mobile_properties, accessors: [ :layout_mobile, :position_mobile, :background_color_mobile, :text_color_mobile, :font_family_mobile, :font_size_mobile ], coder: JSON
  store :seo_page_properties, accessors: [:author, :meta_url, :meta_title, :meta_description, :keywords, :meta_image], coder: JSON

  def to_param
    "#{id}-#{slug}"
  end
  
  def turbolink_is_active
    body_layout != "fancy_sidebar_navigation"
  end

  private
  def set_slug
    self.slug = self.slug.present? ? self.slug.to_s.parameterize : self.title
  end
end
