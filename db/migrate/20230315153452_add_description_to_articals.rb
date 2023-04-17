class AddDescriptionToArticals < ActiveRecord::Migration[7.0]
  def change
    add_column :articals, :description, :string
  end
end
