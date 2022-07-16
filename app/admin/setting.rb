ActiveAdmin.register Setting do
  yaml_url_media_socials = HashWithIndifferentAccess.new(YAML.load_file Rails.root.join('config', 'setting.yml'))
  permit_params :name, :phone, yaml_url_media_socials[:url_media_socials]

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
      f.input :phone
      f.inputs 'Media Social URL' do
        yaml_url_media_socials[:url_media_socials].each do |x|
          f.input x
        end
      end
    end
    f.actions
  end

end
