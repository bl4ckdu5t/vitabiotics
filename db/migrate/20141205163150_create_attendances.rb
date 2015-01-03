class CreateAttendances < ActiveRecord::Migration
  def change
  	create_table :attendances do |t|
  		t.integer :staff_id
  		t.boolean :presence
  		t.datetime :date

  		t.timestamps
  	end
  end
end
