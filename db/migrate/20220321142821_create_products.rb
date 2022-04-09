class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :sku
      t.string :short_description
      t.text :description
      t.integer :position
      t.string :slug
      t.string :url
      t.integer :price
      t.integer :discount
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
