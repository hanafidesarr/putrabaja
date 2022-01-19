class CreateAttachments < ActiveRecord::Migration[6.0]
  def change
    create_table :attachments do |t|
      t.string :asset
      t.string :type
      t.string :content_type
      t.integer :file_size
      t.integer :position
      t.integer :parent_id
      t.string :parent_type
      t.boolean :active
      t.text :note

      t.timestamps
    end
  end
end
