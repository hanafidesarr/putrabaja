class Image < Attachment
  #                     0        1         2         3       4           5
  enum layout_type: [:normal, :banner, :thumbnail, :logo, :perview, :background]

  LAYOUT_TYPE = ["normal", "banner", "thumbnail", "logo", "perview", "background"]
  # scoped area
  # default_scope { where("layout_type = ?", 2) }
  # default_scope { where(active: true) }

  # scope :active, -> { where(active: true) }
  
  scope :active, -> { where("active = ?", true) }
  scope :normals, -> { where("layout_type = ?", 0) }
  scope :banners, -> { where("layout_type = ?", 1) }
  scope :thumbnails, -> { where("layout_type = ?", 2) }
  scope :logos, -> { where("layout_type = ?", 3) }
  scope :perviews, -> { where("layout_type = ?", 4) }
  scope :backgrounds, -> { where("layout_type = ?", 5) }

  before_create :set_default_layout_type, if: Proc.new { self.layout_type.nil? }

  # langs translate 
  translates :title, :subtitle, :alt, :note, :fallbacks_for_empty_translations => true
  globalize_accessors :locales => I18n.available_locales, :attributes => [:title, :subtitle, :alt, :note]

  def set_default_layout_type
    self.layout_type = "normal"
  end
end