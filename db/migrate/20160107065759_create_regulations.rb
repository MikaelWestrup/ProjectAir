class CreateRegulations < ActiveRecord::Migration
  def change
    create_table :regulations do |t|
      t.text :name
      t.string :organization

      t.timestamps null: false
    end
  end
end
