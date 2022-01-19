class CreateComponents < ActiveRecord::Migration[6.0]
  def change
    create_table :components do |t|
      t.string :name
      t.string :type
      t.string :layout
      t.string :url
      t.boolean :active
      t.string :status
      t.text :note
      t.text :description
      t.integer :position
      t.integer :page_id

      t.timestamps
    end
  end
end
