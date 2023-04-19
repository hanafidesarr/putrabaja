class TranslatePageSeo < ActiveRecord::Migration[6.0]
  def self.up
    Page.create_translation_table!({
      :meta_title => :string,
      :keywords => :text,
      :meta_description => :text,
      :author => :string,
      :meta_url => :string,
      :meta_image => :string
    }, {
      :migrate_data => true,
      :remove_source_columns => true
    })
  end

  def self.down
    Page.drop_translation_table! :migrate_data => true
  end
end
