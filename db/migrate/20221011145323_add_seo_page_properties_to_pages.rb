class AddSeoPagePropertiesToPages < ActiveRecord::Migration[6.0]
  def change
    add_column :pages, :seo_page_properties, :text
  end
end
