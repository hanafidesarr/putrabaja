class AddImageTypeToProducts < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :image_type, :integer, default: 0
  end
end
