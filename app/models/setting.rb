class Setting < ApplicationRecord

  # after_initialize :reset_store_accessors
  
  yaml_url_media_socials = HashWithIndifferentAccess.new(YAML.load_file Rails.root.join('config', 'setting.yml'))

  store :url_media_socials, accessors: yaml_url_media_socials[:url_media_socials], coder: JSON

  has_many :attachments, class_name: "Attachment",  as: "parent", dependent: :destroy


  accepts_nested_attributes_for :attachments, :allow_destroy => true
  # def reset_store_accessors
  #   yaml_url_media_socials = HashWithIndifferentAccess.new(YAML.load_file Rails.root.join('config', 'setting.yml'))
  #   self.url_media_socials = yaml_url_media_socials[:url_media_socials]
  # end
end
