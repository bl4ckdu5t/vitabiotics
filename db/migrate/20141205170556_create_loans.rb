class CreateLoans < ActiveRecord::Migration
  def change
    create_table :loans do |t|
      t.integer :staff_id
      t.string :registration_no
      t.datetime :confirm_date
      t.string :guarantor_name
      t.string :guarantor_dept
      t.string :loan_purpose
      t.boolean :loan_approved
      t.string :monthly_deduction

      t.timestamps
    end
  end
end
