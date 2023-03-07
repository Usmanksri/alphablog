
ActiveRecord::Schema[7.0].define(version: 2023_03_07_155344) do
  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
