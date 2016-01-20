# == Schema Information
#
# Table name: attachment_types
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class AttachmentType < ActiveRecord::Base
  # Validations for storing filtered data
  validates_presence_of :name

  # Relations/Associations with other models
  has_many :attachments
end
