class CreateParagraphTypes < ActiveRecord::Migration
  def change
    create_table :paragraph_types do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
