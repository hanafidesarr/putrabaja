class AddSeoProductPropertiesToProducts < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :seo_product_properties, :text
  end
end
