# == Schema Information
#
# Table name: departments
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  code       :string(255)
#  company_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Department < ActiveRecord::Base
  # Validations for storing filtered data
  validates_presence_of :name, :company

  # Relations/Associations with other models
  belongs_to :company
  has_many :employees, dependent: :destroy
end
