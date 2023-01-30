class AddAltToAttachments < ActiveRecord::Migration[6.0]
  def change
    add_column :attachments, :alt, :string
  end
end
