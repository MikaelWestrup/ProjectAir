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
  before_save :check_parameters
  # Validations for storing filtered data
  validates_presence_of :name, :period_start, :period_end
  validates_presence_of :audit_type#, :location 

  # Relations/Associations with other models
  belongs_to :location
  belongs_to :audit_type
  has_many :fine_tunes, dependent: :destroy
  has_many :audit_items, dependent: :destroy
  has_many :audit_items, dependent: :destroy
  has_many :paragraphs, :through => :audit_items
  has_many :auditor_employees, dependent: :destroy
  has_many :auditors, :through => :auditor_employees, :source => :employee
  has_many :auditee_employees, dependent: :destroy
  has_many :auditees, :through => :auditee_employees, :source => :employee

  private
    def check_parameters
      self.onsite = self.location.present? ? true : false
      if self.interval.present? && self.interval > 0
        self.reoccuring = true
      else
        self.interval = nil
        self.reoccuring = false
      end
      return self
    end
end
