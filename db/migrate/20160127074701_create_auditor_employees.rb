class CreateAuditorEmployees < ActiveRecord::Migration
  def change
    create_table :auditor_employees do |t|
      t.integer :audit_id
      t.integer :employee_id

      t.timestamps null: false
    end
  end
end
