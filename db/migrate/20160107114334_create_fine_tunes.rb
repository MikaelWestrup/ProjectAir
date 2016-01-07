class CreateFineTunes < ActiveRecord::Migration
  def change
    create_table :fine_tunes do |t|
      t.date :ddate
      t.time :start_hour
      t.time :end_hour
      t.text :notes
      t.integer :audit_id
      t.integer :paragraph_id

      t.timestamps null: false
    end
  end
end
