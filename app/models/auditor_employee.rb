# == Schema Information
#
# Table name: auditor_employees
#
#  id          :integer          not null, primary key
#  audit_id    :integer
#  employee_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class AuditorEmployee < ActiveRecord::Base
  belongs_to :audit
  belongs_to :employee
end
