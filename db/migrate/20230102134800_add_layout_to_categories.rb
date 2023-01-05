class AddLayoutToCategories < ActiveRecord::Migration[6.0]
  def change
    add_column :categories, :layout, :string
  end
end
