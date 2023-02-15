class AddSeoProductPropertiesToCategories < ActiveRecord::Migration[6.0]
  def change
    add_column :categories, :seo_product_properties, :text
  end
end
