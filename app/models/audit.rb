# == Schema Information
#
# Table name: audits
#
#  id            :integer          not null, primary key
#  name          :string(255)
#  audit_type_id :integer
#  period_start  :datetime
#  period_end    :datetime
#  planner       :string(255)
#  location_id   :integer
#  interval      :integer
#  notes         :text(65535)
#  reoccuring    :boolean          default(FALSE)
#  onsite        :boolean          default(FALSE)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Audit < ActiveRecord::Base
  # Validations for storing filtered data
  validates_presence_of :name, :period_start, :period_end
  validates_presence_of :audit_type#, :location 

  # Relations/Associations with other models
  belongs_to :location
  belongs_to :audit_type
  has_many :auditors, ->(o) { where "`audit_employees`.`role` = 'Auditor'" }, :through => :audit_employees, :source => :employee
  has_many :auditees, ->(o) { where "`audit_employees`.`role` = 'Auditee'" }, :through => :audit_employees, :source => :employee
  has_many :fine_tunes
  has_many :audit_items
  has_many :audit_employees
  has_many :paragraphs, :through => :audit_items
end
