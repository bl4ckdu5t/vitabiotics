class CreateDepartments < ActiveRecord::Migration
  def change
    create_table :departments do |t|
      t.string :name
      t.boolean :child_department
      t.string :parent

      t.timestamps
    end
  end
end
