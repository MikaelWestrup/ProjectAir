class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :name
      t.string :country
      t.string :airport
      t.text :address
      t.string :zipcode
      t.string :town
      t.text :additional_details

      t.timestamps null: false
    end
  end
end
