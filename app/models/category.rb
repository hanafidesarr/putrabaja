class Category < ApplicationRecord

  default_scope { order(:position) }
  scope :active, -> { where(active:true) }
  scope :root, -> { where("parent_id IS NULL") }
  scope :child, -> { where("parent_id IS NOT NULL") }

  # association model
  belongs_to  :parent, class_name: self.name, foreign_key: "parent_id", touch: true, optional: true
  has_many    :children,  class_name: self.name,    foreign_key: "parent_id", inverse_of: :parent
  has_many :products
  has_ancestry :orphan_strategy => :rootify

  # nested attribute
  accepts_nested_attributes_for :children, :allow_destroy => true
  accepts_nested_attributes_for :products, :allow_destroy => true

  def is_root?
    parent_id.nil?
  end

end
