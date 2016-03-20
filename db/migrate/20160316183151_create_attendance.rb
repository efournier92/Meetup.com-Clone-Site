class CreateAttendance < ActiveRecord::Migration
  def change
    create_table "attendances" do |t|
      t.integer  "user_id",                  null: false
      t.integer  "meetup_id",                null: false
      t.boolean  "creator",  default: false, null: false
    end
  end
end
