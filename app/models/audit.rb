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
#  auditor_id    :integer
#  auditee_id    :integer
#  notes         :text(65535)
#  reoccuring    :boolean          default(FALSE)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Audit < ActiveRecord::Base
  # Validations for storing filtered data
  validates_presence_of :name, :period_start, :period_end, :interval, :reoccuring
  validates_presence_of :audit_type#, :location 

  # Relations/Associations with other models
  belongs_to :location
  belongs_to :audit_type
  has_one :auditor, class_name: 'Employee', foreign_key: 'auditor_id'
  has_one :auditee, class_name: 'Employee', foreign_key: 'auditee_id'
  has_many :fine_tunes
end
