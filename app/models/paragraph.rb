# == Schema Information
#
# Table name: paragraphs
#
#  id                        :integer          not null, primary key
#  name                      :string(255)
#  number                    :string(255)
#  description               :text(65535)
#  up_to_including_amendment :text(65535)
#  paragraph_type_id         :integer
#  chapter_id                :integer
#  created_at                :datetime         not null
#  updated_at                :datetime         not null
#

class Paragraph < ActiveRecord::Base
  # Validations for storing filtered data
  validates_presence_of :name, :description, :up_to_including_amendment, :paragraph_type_id, :chapter_id

  # Relations/Associations with other models
  belongs_to :chapter
  belongs_to :paragraph_type
end
