class Attachment < ApplicationRecord
	belongs_to :parent, polymorphic: true, foreign_key: "parent_id", touch: true, optional: true
	mount_uploader :asset, ::FileUploader

	store :attachment_properties, accessors: [ :image_quality, :background_image_size, :background_image_position, :background_image_color ], coder: JSON
	
	def check_type_image
		asset.identifier.split(".").last
	end
end
