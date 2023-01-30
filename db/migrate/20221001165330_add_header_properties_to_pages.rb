class AddHeaderPropertiesToPages < ActiveRecord::Migration[6.0]
  def change
    add_column :pages, :header_desktop_properties, :text
    add_column :pages, :header_mobile_properties, :text
  end
end
