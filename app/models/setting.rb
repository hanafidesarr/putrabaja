class Setting < ApplicationRecord

  # after_initialize :reset_store_accessors
  

  # store_accessor
  # https://api.rubyonrails.org/classes/ActiveRecord/Store.html
  yaml_url_media_socials = HashWithIndifferentAccess.new(YAML.load_file Rails.root.join('config', 'setting.yml'))
  store :url_media_socials, accessors: yaml_url_media_socials[:url_media_socials], coder: JSON

  # association area
  has_many :images, class_name: "Image",  as: "parent", dependent: :destroy

  # nested attribute form
  accepts_nested_attributes_for :images, :allow_destroy => true

  # def reset_store_accessors
  #   yaml_url_media_socials = HashWithIndifferentAccess.new(YAML.load_file Rails.root.join('config', 'setting.yml'))
  #   self.url_media_socials = yaml_url_media_socials[:url_media_socials]
  # end
end
