class Product < ApplicationRecord


  # scoped area
  default_scope { order(:position) }
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
  store :tech_specification, accessors: [:battery_life, :model, :processor, :memory, :hard_drive, :vga, :display_type, :os, :optical_drive, :warranty, :wireless, :bluetooth, :other], coder: JSON


end
