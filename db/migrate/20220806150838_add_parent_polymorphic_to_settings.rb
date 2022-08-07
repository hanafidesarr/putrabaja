class AddParentPolymorphicToSettings < ActiveRecord::Migration[6.0]
  def change
    add_column :settings, :parent_id, :integer
    add_column :settings, :parent_type, :string
  end
end
