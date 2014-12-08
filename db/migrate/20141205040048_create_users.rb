class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :usertype
      t.string :email
      t.string :avatar
      t.string :password

      t.timestamps
    end
  end
end
