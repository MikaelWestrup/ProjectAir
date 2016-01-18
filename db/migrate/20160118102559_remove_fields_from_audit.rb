class RemoveFieldsFromAudit < ActiveRecord::Migration
  change_table :audits do |t|
    t.remove :auditor_id, :auditee_id
    t.rename :onside, :onsite
  end
end
