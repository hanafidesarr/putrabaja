class Product < ApplicationRecord


  # scoped area
  default_scope { order(:position) }
  scope :active, -> { where(active:true) }
  scope :design, -> { where("image_type = ?", 1) }
  scope :normal, -> { where("image_type = ?", 0) }

  # association area
  belongs_to :category
  has_many :images,  class_name: "Image",  as: "parent", dependent: :destroy
  has_ancestry :orphan_strategy => :rootify
  # has_many :media_socials

  # nested attribute form
  accepts_nested_attributes_for :images, :allow_destroy => true
  # accepts_nested_attributes_for :media_socials, :allow_destroy => true


  # Enum 0..5          0,       1,
  enum image_type: [:normal, :design]

  # store_accessor
  # https://api.rubyonrails.org/classes/ActiveRecord/Store.html
  store :properties, accessors: [:video_url, :note], coder: JSON

  # validation
  after_validation :set_slug, only: [:create, :update]

  def to_param
    "#{id}-#{slug}"
  end

  private
  def set_slug
    self.slug = self.slug.present? ? self.slug.to_s.parameterize : self.name
  end
end
