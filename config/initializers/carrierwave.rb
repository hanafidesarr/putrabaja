CarrierWave.configure do |config|
	config.fog_credentials = {
		provider:              'AWS',                            # required
		aws_access_key_id:     'AKIAT4ECGFWJISJABLFO',            # required
		aws_secret_access_key: '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',            # required
		region:                'ap-southeast-1'                       # to match the carrierwave and bucket region
	}
	config.fog_directory = ENV["AWS_BUCKET"]                   # required
	config.fog_public    = false
	config.cache_dir     = "#{Rails.root}/tmp/uploads"         # To let CarrierWave work on Heroku
	config.storage       = :fog

end