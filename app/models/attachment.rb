class Attachment < ApplicationRecord
	mount_uploader :asset, ::FileUploader
end
