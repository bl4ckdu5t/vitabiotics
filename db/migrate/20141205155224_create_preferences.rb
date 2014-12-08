class CreatePreferences < ActiveRecord::Migration
  def change
    create_table :preferences do |t|
      t.string :company_name
      t.string :website
      t.string :theme
      t.string :header_image

      t.timestamps
    end
  end
end
