# == Schema Information
#
# Table name: audit_employees
#
#  id          :integer          not null, primary key
#  audit_id    :integer
#  employee_id :integer
#  role        :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class AuditEmployee < ActiveRecord::Base
  belongs_to :audit
  belongs_to :employee
end
