class AddHeaderStyleToSettings < ActiveRecord::Migration[6.0]
  def change
    add_column :settings, :header_style, :text
  end
end
