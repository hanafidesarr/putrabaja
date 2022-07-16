class AddPhoneToAdminUsers < ActiveRecord::Migration[6.0]
  def up
    add_column :admin_users, :phone, :string
  end
  def down
    remove_column :admin_users, :phone, :string
  end
end
