class AddUrlToAttachments < ActiveRecord::Migration[6.0]
  def change
    add_column :attachments, :url, :string
  end
end
