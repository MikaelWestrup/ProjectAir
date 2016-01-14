class CreateAudits < ActiveRecord::Migration
  def change
    create_table :audits do |t|
      t.string :name
      t.integer :audit_type_id
      t.datetime :period_start
      t.datetime :period_end
      t.string :planner
      t.integer :location_id
      t.integer :interval
      t.integer :auditor_id
      t.integer :auditee_id
      t.text :notes
      t.boolean :reoccuring, default: false
      t.boolean :onside, default: false
      t.text :notes

      t.timestamps null: false
    end
  end
end
