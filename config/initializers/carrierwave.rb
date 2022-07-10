CarrierWave.configure do |config|
	config.fog_credentials = {
		provider:              'AWS',                            # required
		aws_access_key_id:     'AKIAT4ECGFWJGZTWL7H2',            # required
		aws_secret_access_key: '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',            # required
		region:                'us-west-1'                       # to match the carrierwave and bucket region
	}
	config.fog_directory = 'ahaddin'                  # required
	config.fog_public    = false
	config.cache_dir     = "#{Rails.root}/tmp/uploads"         # To let CarrierWave work on Heroku
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