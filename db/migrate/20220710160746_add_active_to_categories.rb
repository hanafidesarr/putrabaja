class AddActiveToCategories < ActiveRecord::Migration[6.0]
  def up
    add_column :categories, :active, :boolean, default: true
  end
  def down
    remove_column :categories, :active, :boolean
  end
end