class CreateChapters < ActiveRecord::Migration
  def change
    create_table :chapters do |t|
      t.text :name
      t.string :ctype
      t.string :annex
      t.string :code
      t.integer :regulation_id

      t.timestamps null: false
    end
  end
end
