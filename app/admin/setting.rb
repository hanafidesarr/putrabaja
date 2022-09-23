ActiveAdmin.register Setting do

  menu priority: 5
  # before_filter :skip_sidebar!, :only => :index

  yml_setting = HashWithIndifferentAccess.new(YAML.load_file Rails.root.join('config', 'setting.yml'))
  permit_params :name, :phone, :email, :phone_1, :phone_2, :address, :location, :youtube_url, :map_url, :short_description, :description, yml_setting[:url_media_socials], yml_setting[:general_style], yml_setting[:header_style], yml_setting[:meta],
  images_attributes: [:id, :asset, :title, :active, :layout_type, :url, :alt, :note, :_destroy] 

  include SettingAdmin::Index
  include SettingAdmin::Form
  include SettingAdmin::Controller
end
