class CreateAttendances < ActiveRecord::Migration
  def change
  	create_table :attendances do |t|
  		t.integer :staff_id
  		t.boolean :presence
  		t.integer :day
  		t.integer :month
  		t.integer :year

  		t.timestamps
  	end
  end
end
