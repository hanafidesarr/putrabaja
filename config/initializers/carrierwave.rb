CarrierWave.configure do |config|
	config.fog_credentials = {
		provider:              ENV['provider'],                # required
		aws_access_key_id:     ENV['aws_access_key_id'],       # required
		aws_secret_access_key: ENV['aws_secret_access_key'],   # required
		region:                ENV['region']                   # to match the carrierwave and bucket region
	}
	config.fog_directory = ENV['fog_directory']              # required
	config.fog_public    = false
	config.cache_dir     = "#{Rails.root}/tmp/uploads"   # To let CarrierWave work on Heroku
	config.storage       = :fog

end

module CarrierWave
	module MiniMagick
	  def quality(percentage)
			manipulate! do |img|
				img.quality(percentage)
				img = yield(img) if block_given?
				img
			end
	  end
	end
end