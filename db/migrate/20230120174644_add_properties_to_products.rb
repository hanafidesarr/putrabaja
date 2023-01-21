class AddPropertiesToProducts < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :properties, :text
  end
end
