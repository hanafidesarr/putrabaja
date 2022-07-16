class AddUrlMediaSocialsToSettings < ActiveRecord::Migration[6.0]
  def up
    add_column :settings, :url_media_socials, :text
  end
  def down
    remove_column :settings, :url_media_socials, :text
  end
end
