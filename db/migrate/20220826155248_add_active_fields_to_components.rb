class AddActiveFieldsToComponents < ActiveRecord::Migration[6.0]
  def change
    add_column :components, :active_fields, :text
  end
end
