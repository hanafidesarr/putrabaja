ActiveAdmin.register Setting do

  menu priority: 5
  yaml_url_media_socials = HashWithIndifferentAccess.new(YAML.load_file Rails.root.join('config', 'setting.yml'))
  permit_params :name, :phone, :email, :phone_1, :phone_2, :address, :location, :youtube_url, :map_url, :short_description, :description, yaml_url_media_socials[:url_media_socials]

  index do
    selectable_column
    id_column
    column :name
    column :phone
    actions
  end

  filter :name
  filter :phone

  form do |f|
    f.inputs do
      f.input :name
      f.input :email
      f.input :phone_1
      f.input :phone_2
      f.input :address
      f.input :location
      f.input :youtube_url
      f.input :map_url
      f.input :short_description
      f.input :description
      f.inputs 'Media Social URL' do
        yaml_url_media_socials[:url_media_socials].each do |x|
          f.input x
        end
      end
    end
    f.actions
  end

end
