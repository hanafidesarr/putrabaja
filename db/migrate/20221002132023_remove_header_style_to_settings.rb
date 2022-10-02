class RemoveHeaderStyleToSettings < ActiveRecord::Migration[6.0]
  def change
    remove_column :settings, :header_style, :text
  end

  def down
    add_column :settings, :header_style, :text
  end
end
