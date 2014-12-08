class Attendance < ActiveRecord::Migration
  def change
  	create_table :attendance do |t|
  		t.integer :staff_id
  		t.datetime :absence_date
  		t.integer :streak

  		t.timestamps
  	end
  end
end
