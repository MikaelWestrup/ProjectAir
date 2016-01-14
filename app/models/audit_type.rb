# == Schema Information
#
# Table name: audit_types
#
#  id           :integer          not null, primary key
#  name         :string(255)
#  is_parent    :boolean          default(FALSE)
#  main_type_id :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class AuditType < ActiveRecord::Base
  # Validations for storing filtered data
  validates_presence_of :name

  # Relations/Associations with other models
  belongs_to :main_type, class_name: 'AuditType', foreign_key: 'main_type_id'
  has_many :sub_types, class_name: 'AuditType', foreign_key: 'main_type_id', dependent: :destroy
  has_many :audits #, dependent: :destroy
end
