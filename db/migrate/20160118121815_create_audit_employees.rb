class CreateAuditEmployees < ActiveRecord::Migration
  def change
    create_table :audit_employees do |t|
      t.integer :audit_id
      t.integer :employee_id
      t.string :role

      t.timestamps null: false
    end
  end
end
