class Image < Attachment
  #                     0        1         2         3       4
  enum layout_type: [:normal, :banner, :thumbnail, :logo, :perview]

  LAYOUT_TYPE = ["normal", "banner", "thumbnail", "logo", "perview"]
  # scoped area
  # default_scope { where("layout_type = ?", 2) }
  # default_scope { where(active: true) }

  # scope :active, -> { where(active: true) }
  
  scope :normals, -> { where("layout_type = ?", 0) }
  scope :banners, -> { where("layout_type = ?", 1) }
  scope :thumbnails, -> { where("layout_type = ?", 2) }
  scope :logos, -> { where("layout_type = ?", 3) }
  scope :perviews, -> { where("layout_type = ?", 4) }

end