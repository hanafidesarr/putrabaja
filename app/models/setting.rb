class Setting < ApplicationRecord

  # after_initialize :reset_store_accessors
  
  yaml_url_media_socials = HashWithIndifferentAccess.new(YAML.load_file Rails.root.join('config', 'setting.yml'))

  store :url_media_socials, accessors: yaml_url_media_socials[:url_media_socials], coder: JSON

  # def reset_store_accessors
  #   yaml_url_media_socials = HashWithIndifferentAccess.new(YAML.load_file Rails.root.join('config', 'setting.yml'))
  #   self.url_media_socials = yaml_url_media_socials[:url_media_socials]
  # end
end
