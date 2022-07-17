class AddAttributeFooterToSettings < ActiveRecord::Migration[6.0]
  def up
    add_column :settings, :description, :text
    add_column :settings, :short_description, :string
    add_column :settings, :email, :string
    add_column :settings, :phone_1, :string
    add_column :settings, :phone_2, :string
    add_column :settings, :address, :string
    add_column :settings, :location, :string
    add_column :settings, :youtube_url, :string
    add_column :settings, :map_url, :string
  end
  def down
    remove_column :settings, :description, :text
    remove_column :settings, :short_description, :string
    remove_column :settings, :email, :string
    remove_column :settings, :phone_1, :string
    remove_column :settings, :phone_2, :string
    remove_column :settings, :address, :string
    remove_column :settings, :location, :string
    remove_column :settings, :youtube_url, :string
    remove_column :settings, :map_url, :string
  end
end
