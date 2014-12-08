class CreateSabbaticals < ActiveRecord::Migration
  def change
    create_table :sabbaticals do |t|
      t.integer :staff_id
      t.string :type
      t.string :registration_no
      t.string :duration
      t.datetime :commence_date
      t.datetime :resume_date
      t.string :reason
      t.string :encashment

      t.timestamps
    end
  end
end
