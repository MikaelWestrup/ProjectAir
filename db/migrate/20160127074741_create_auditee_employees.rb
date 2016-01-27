class CreateAuditeeEmployees < ActiveRecord::Migration
  def change
    create_table :auditee_employees do |t|
      t.integer :audit_id
      t.integer :employee_id

      t.timestamps null: false
    end
  end
end
