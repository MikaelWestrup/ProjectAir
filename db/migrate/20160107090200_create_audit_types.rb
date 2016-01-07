class CreateAuditTypes < ActiveRecord::Migration
  def change
    create_table :audit_types do |t|
      t.string :name
      t.boolean :is_parent, default: false
      t.integer :main_type_id

      t.timestamps null: false
    end
  end
end
