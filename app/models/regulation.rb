# == Schema Information
#
# Table name: regulations
#
#  id           :integer          not null, primary key
#  name         :text(65535)
#  organization :string(255)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Regulation < ActiveRecord::Base
  # Validations for storing filtered data
  validates_presence_of :name, :organization

  # Relations/Associations with other models
  has_many :chapters
end
