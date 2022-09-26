class Attachment < ApplicationRecord
	belongs_to :parent, polymorphic: true, foreign_key: "parent_id", touch: true, optional: true
	mount_uploader :asset, ::FileUploader

	def check_type_image
		asset.identifier.split(".").last
	end
end
