class TranslateComponent < ActiveRecord::Migration[6.0]
  def change
    reversible do |dir|
      dir.up do
        Component.create_translation_table!({
          :title => :string,
          :subtitle => :string,
          :slug => :string,
          :link => :string,
          :body => :string,

        }, {
          :migrate_data => true,
          :remove_source_columns => true
        })
      end

      dir.down do
        Component.drop_translation_table! :migrate_data => true
      end
    end
  end  
end
