class CreateSubscribeUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :subscribe_users do |t|
      t.string :name
      t.string :phone
      t.string :email
      t.text :note

      t.timestamps
    end
  end
end
