class CreateReliefs < ActiveRecord::Migration
  def change
    create_table :reliefs do |t|
      t.datetime :date
      t.string :type
      t.integer :staff_id
      t.string :reason
      t.datetime :time_out
      t.datetime :time_in

      t.timestamps
    end
  end
end
