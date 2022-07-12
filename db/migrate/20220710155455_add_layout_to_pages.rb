class AddLayoutToPages < ActiveRecord::Migration[6.0]
  def up
    add_column :pages, :layout, :string
  end
  def down
    remove_column :pages, :layout, :string
  end
end
