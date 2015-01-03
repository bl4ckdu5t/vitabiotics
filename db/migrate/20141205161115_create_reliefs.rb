class CreateReliefs < ActiveRecord::Migration
  def change
    create_table :reliefs do |t|
      t.datetime :date
      t.string :category
      t.integer :staff_id
      t.string :reason
      t.time :time_out
      t.time :time_in

      t.timestamps
    end
  end
end
