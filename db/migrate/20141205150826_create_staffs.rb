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
      t.string :martial_status
      t.string :spouse_name
      t.string :name_of_child
      t.string :phone
      t.string :email
      t.string :department
      t.string :designation
      t.string :staff_from
      t.string :staff_till
      t.string :prev_employer
      t.string :post_held
      t.string :years_of_duty
      t.string :state_of_origin
      t.string :nationality
      t.string :town
      t.string :city
      t.string :family_address
      t.string :permanent_address
      t.string :residence
      t.string :next_of_kin
      t.string :phone_of_kin
      t.string :address_of_kin
      t.string :annual_salary

      t.timestamps
    end
  end
end
