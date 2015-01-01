class CreateStaffs < ActiveRecord::Migration
  def change
    create_table :staffs do |t|
      t.string :title
      t.string :surname
      t.string :othernames
      t.string :maiden_name
      t.string :gender
      t.string :avatar
      t.string :date_of_birth
      t.string :marital_status
      t.string :spouse
      t.string :first_child
      t.string :phone
      t.string :email
      t.string :department
      t.string :designation
      t.string :staff_from
      t.string :staff_till
      t.string :prev_employer
      t.string :post_held
      t.string :duty_years
      t.string :state
      t.string :nationality
      t.string :town
      t.string :city
      t.string :family_address
      t.string :permanent_address
      t.string :residence
      t.string :kin
      t.string :kin_phone
      t.string :kin_address
      t.string :annual_salary

      t.timestamps
    end
  end
end
