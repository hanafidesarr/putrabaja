class Product < ApplicationRecord

  default_scope { order(:position) }

  belongs_to :category
  has_many :attachments,  class_name: "Attachment",  as: "parent", dependent: :destroy
  has_ancestry :orphan_strategy => :rootify
  # has_many :media_socials

  accepts_nested_attributes_for :attachments, :allow_destroy => true
  # accepts_nested_attributes_for :media_socials, :allow_destroy => true

  scope :design, -> { where("image_type = ?", 1) }
  scope :normal, -> { where("image_type = ?", 0) }

  # Enum 0..5          0,       1,
  enum image_type: [:normal, :design]

  store :tech_specification, accessors: [:battery_life, :model, :processor, :memory, :hard_drive, :vga, :display_type, :os, :optical_drive, :warranty, :wireless, :bluetooth, :other], coder: JSON


end
