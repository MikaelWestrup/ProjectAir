class CreateAttachments < ActiveRecord::Migration
  def change
    create_table :attachments do |t|
      t.string :name
      t.string :number
      t.text :description
      t.text :up_to_including_amendment
      t.integer :attachment_type_id
      t.integer :paragraph_id

      t.timestamps null: false
    end
  end
end
