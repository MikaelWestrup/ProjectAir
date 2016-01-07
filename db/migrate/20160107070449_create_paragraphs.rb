class CreateParagraphs < ActiveRecord::Migration
  def change
    create_table :paragraphs do |t|
      t.string :name
      t.string :number
      t.text :description
      t.text :up_to_including_amendment
      t.integer :paragraph_type_id
      t.integer :chapter_id

      t.timestamps null: false
    end
  end
end
