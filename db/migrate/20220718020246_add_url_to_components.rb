class AddUrlToComponents < ActiveRecord::Migration[6.0]
  def change
    add_column :components, :url_product, :string
    add_column :components, :url_text, :string
  end
end
