class AddSlugToComponents < ActiveRecord::Migration[6.0]
  def change
    add_column :components, :slug, :string
  end
end
