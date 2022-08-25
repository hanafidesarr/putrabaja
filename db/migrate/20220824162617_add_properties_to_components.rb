class AddPropertiesToComponents < ActiveRecord::Migration[6.0]
  def change
    add_column :components, :properties, :text
  end
end
