ActiveAdmin.register Setting do

  menu priority: 5
  before_filter :skip_sidebar!, :only => :index

  yaml_url_media_socials = HashWithIndifferentAccess.new(YAML.load_file Rails.root.join('config', 'setting.yml'))
  permit_params :name, :phone, :email, :phone_1, :phone_2, :address, :location, :youtube_url, :map_url, :short_description, :description, yaml_url_media_socials[:url_media_socials],
  images_attributes: [:id, :asset, :title, :_destroy] 

  include SettingAdmin::Index
  include SettingAdmin::Form
  include SettingAdmin::Controller
end
