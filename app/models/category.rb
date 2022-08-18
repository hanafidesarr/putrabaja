class Category < ApplicationRecord

  # scoped area
  scope :active, -> { where(active:true) }
  scope :root, -> { where("parent_id IS NULL") }
  scope :child, -> { where("parent_id IS NOT NULL") }

  # association area
  belongs_to  :parent, class_name: self.name, foreign_key: "parent_id", touch: true, optional: true #this for nested parent children
  has_many    :children,  class_name: self.name,    foreign_key: "parent_id", inverse_of: :parent #this for nested parent children
  has_many    :products

  # nested attribute form
  accepts_nested_attributes_for :children, :allow_destroy => true
  accepts_nested_attributes_for :products, :allow_destroy => true

  def is_root?
    parent_id.nil?
  end
end
