class CreateAuditItems < ActiveRecord::Migration
  def change
    create_table :audit_items do |t|
      t.integer :audit_id
      t.integer :paragraph_id

      t.timestamps null: false
    end
  end
end
