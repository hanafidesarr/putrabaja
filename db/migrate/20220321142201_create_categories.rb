class CreateCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :categories do |t|
      t.string :name
      t.integer :position
      t.text :description
      t.string :slug
      t.string :url
      t.string :short_description

      t.timestamps
    end
  end
end
