class Category < ApplicationRecord

  # scoped area
  default_scope { order(:position) }
  scope :active, -> { where(active:true) }
  scope :root, -> { where("parent_id IS NULL") }
  scope :child, -> { where("parent_id IS NOT NULL") }

  # association area
  belongs_to  :parent, class_name: self.name, foreign_key: "parent_id", touch: true, optional: true #this for nested parent children
  has_many    :children,  class_name: self.name,    foreign_key: "parent_id", inverse_of: :parent #this for nested parent children
  has_many    :products
  has_many :images,  class_name: "Image",  as: "parent", dependent: :destroy
  has_ancestry :orphan_strategy => :rootify

  # nested attribute form
  accepts_nested_attributes_for :images, :allow_destroy => true
  accepts_nested_attributes_for :children, :allow_destroy => true
  accepts_nested_attributes_for :products, :allow_destroy => true

  # validation
  after_validation :set_slug, only: [:create, :update]

  store :seo_product_properties, accessors: [:author, :meta_url, :meta_image, :meta_title, :keywords, :meta_description], coder: JSON

  def is_root?
    parent_id.nil?
  end



  def to_param
    "#{id}-#{slug}"
  end

  private
  def set_slug
    self.slug = self.slug.present? ? self.slug.to_s.parameterize : self.name
  end

end
