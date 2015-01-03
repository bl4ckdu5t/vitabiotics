class CreateLoans < ActiveRecord::Migration
  def change
    create_table :loans do |t|
      t.integer :staff_id
      t.string :registration_no
      t.datetime :confirm_date
      t.string :guarantor_name
      t.string :guarantor_dept
      t.string :amount
      t.string :purpose
      t.boolean :approval
      t.boolean :paid, default: false
      t.string :monthly_deduction

      t.timestamps
    end
  end
end
