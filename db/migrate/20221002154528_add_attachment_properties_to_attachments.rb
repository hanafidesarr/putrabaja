class AddAttachmentPropertiesToAttachments < ActiveRecord::Migration[6.0]
  def change
    add_column :attachments, :attachment_properties, :text
  end
end
