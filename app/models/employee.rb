# == Schema Information
#
# Table name: employees
#
#  id                  :integer          not null, primary key
#  name                :string(255)
#  address             :text(65535)
#  office_phone        :string(255)
#  cell_phone          :string(255)
#  email               :string(255)
#  role                :string(255)
#  company_id          :integer
#  department_id       :integer
#  avatar_file_name    :string(255)
#  avatar_content_type :string(255)
#  avatar_file_size    :integer
#  avatar_updated_at   :datetime
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

class Employee < ActiveRecord::Base
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  # Validations for storing filtered data
  validates_presence_of :name, :address, :company, :department
  validates_presence_of :office_phone, :cell_phone, numericality: true
  validates_presence_of :email

  # Relations/Associations with other models
  belongs_to :company
  belongs_to :department
  has_many :auditor_employees
  has_many :audits, :through => :auditor_employees
  has_many :auditee_employees
end
