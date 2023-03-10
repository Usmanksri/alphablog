class AddUserIdToArticals < ActiveRecord::Migration[7.0]
  def change
    add_column :articals, :user_id, :int
  end
end
