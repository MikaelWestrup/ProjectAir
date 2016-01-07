# == Schema Information
#
# Table name: paragraph_types
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ParagraphType < ActiveRecord::Base
  # Validations for storing filtered data
  validates_presence_of :name

  # Relations/Associations with other models
  has_one :paragraph
end
