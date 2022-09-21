class AddPropertiesToPages < ActiveRecord::Migration[6.0]
  def change
    add_column :pages, :properties, :text
  end
end
