class SetDefaultValueActiveToComponents < ActiveRecord::Migration[6.0]
  def up
    change_column :components, :active, :boolean, default: true
  end
  def down
    change_column :components, :active, :boolean, default: false
  end
end
