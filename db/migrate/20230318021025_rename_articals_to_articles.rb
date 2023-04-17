class RenameArticalsToArticles < ActiveRecord::Migration[7.0]
  def change
    rename_table :articals, :articles
  end
end
