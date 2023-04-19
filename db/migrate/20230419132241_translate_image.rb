class TranslateImage < ActiveRecord::Migration[6.0]
  def self.up
    Image.create_translation_table!({
      :title => :string,
      :subtitle => :string,
      :alt => :string,
      :note => :text
    }, {
      :migrate_data => true,
      :remove_source_columns => true
    })
  end

  def self.down
    Image.drop_translation_table! :migrate_data => true
  end
end
