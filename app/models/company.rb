# == Schema Information
#
# Table name: companies
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  code       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Company < ActiveRecord::Base
  # Validations for storing filtered data
  validates_presence_of :name

  # Relations/Associations with other models
  has_many :departments, dependent: :destroy
end
