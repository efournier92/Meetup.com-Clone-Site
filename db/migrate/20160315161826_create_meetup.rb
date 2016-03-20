class CreateMeetup < ActiveRecord::Migration
  def change
    create_table :meetups do |t|
      t.string  "name"
      t.text    "description"
      t.string  "location"
    end
  end
end
