class Attachment < ApplicationRecord
	belongs_to :parent, polymorphic: true, foreign_key: "parent_id", touch: true, optional: true
	mount_uploader :asset, ::FileUploader

	store :attachment_properties, accessors: [ :subtitle, :image_quality, :background_image_size, :background_image_position, :background_image_color, :background_image_repeat, :url_image, :url_image_thumb, :price, :series, :width, :height, :class_image, :style_image, :group_list ], coder: JSON
	
	def check_type_image
		asset.identifier.split(".").last
	end
	
end
