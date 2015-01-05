class CreateAnnouncements < ActiveRecord::Migration
  def change
    create_table :announcements do |t|
      t.integer :sender
      t.integer :receiver
      t.boolean :read, default: false
      t.text :message
      t.timestamps
    end
  end
end
