class AddLayoutTypeToAttachments < ActiveRecord::Migration[6.0]
  def change
    add_column :attachments, :layout_type, :integer
  end
end
