class AddFooterToPages < ActiveRecord::Migration[6.0]
  def change
    add_column :pages, :footer, :text
  end
end
