ActiveRecord::Schema.define(version: 20160316183151) do

	enable_extension "plpgsql"

	create_table "attendances", force: :cascade do |t|
		t.integer "user_id",                   null: false
		t.integer "meetup_id",                 null: false
		t.boolean "creator",   default: false, null: false
	end

	create_table "meetups", force: :cascade do |t|
		t.string "name"
		t.text   "description"
		t.string "location"
	end

	create_table "users", force: :cascade do |t|
		t.string   "provider",   null: false
		t.string   "uid",        null: false
		t.string   "username",   null: false
		t.string   "email",      null: false
		t.string   "avatar_url", null: false
		t.datetime "created_at", null: false
		t.datetime "updated_at", null: false
	end

	add_index "users", ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true, using: :btree

end
