class CreateMediaSocials < ActiveRecord::Migration[6.0]
  def change
    create_table :media_socials do |t|
      t.string :name
      t.text :description
      t.text :product_message
      t.string :product_url
      t.string :profile_url
      t.integer :product_id

      t.timestamps
    end
  end
end
