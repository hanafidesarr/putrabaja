class SetDefaultValueActiveToImages < ActiveRecord::Migration[6.0]
  def up
    change_column :attachments, :active, :boolean, default: true
  end
  def down
    change_column :attachments, :active, :boolean, default: false
  end
end
