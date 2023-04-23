class AddAttrLinkTranslation < ActiveRecord::Migration[6.0]
  def change
    reversible do |dir|
      dir.up do
        Page.add_translation_fields! link: :string
      end

      dir.down do
        remove_column :page_translations, :author
      end
    end
  end
end
