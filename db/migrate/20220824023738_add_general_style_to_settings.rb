class AddGeneralStyleToSettings < ActiveRecord::Migration[6.0]
  def change
    add_column :settings, :general_style, :text
  end
end
