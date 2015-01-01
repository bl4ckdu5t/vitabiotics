class CreatePreferences < ActiveRecord::Migration
  def change
    create_table :preferences do |t|
      t.string :company
      t.string :website
      t.string :theme
      t.string :header

      t.timestamps
    end
  end
end
