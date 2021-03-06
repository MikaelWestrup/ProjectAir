# == Schema Information
#
# Table name: attachments
#
#  id                        :integer          not null, primary key
#  name                      :string(255)
#  number                    :string(255)
#  description               :text(65535)
#  up_to_including_amendment :text(65535)
#  attachment_type_id        :integer
#  paragraph_id              :integer
#  created_at                :datetime         not null
#  updated_at                :datetime         not null
#

class Attachment < ActiveRecord::Base
  before_save :set_attachment_number
  # Validations for storing filtered data
  validates_presence_of :name, :description, :up_to_including_amendment, :paragraph

  # Relations/Associations with other models
  belongs_to :attachment_type
  belongs_to :paragraph

  private
    def set_attachment_number
      self.number = self.name.split(/[()]/)[1].upcase
    end
end
