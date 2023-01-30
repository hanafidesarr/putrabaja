class AddMetaToSettings < ActiveRecord::Migration[6.0]
  def change
    add_column :settings, :meta, :text
  end
end
