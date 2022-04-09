ActiveAdmin.register Category do

  permit_params :id, :name, :short_description, :description, :price

  index do
    selectable_column
    id_column
    column :name
    column :short_description
    column :description
    column :created_at
    actions
  end

  filter :name
  filter :short_description
  filter :description

  form do |f|
    f.inputs do
      f.input :name
      f.input :short_description
      f.input :description
    end
    f.actions
  end
end