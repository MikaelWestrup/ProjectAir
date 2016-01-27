# == Schema Information
#
# Table name: paragraphs
#
#  id                        :integer          not null, primary key
#  name                      :string(255)
#  number                    :string(255)
#  description               :text(65535)
#  up_to_including_amendment :text(65535)
#  chapter_id                :integer
#  created_at                :datetime         not null
#  updated_at                :datetime         not null
#

class Paragraph < ActiveRecord::Base
  before_save :set_paragraph_number
  # Validations for storing filtered data
  validates_presence_of :name, :description, :up_to_including_amendment, :chapter_id

  # Relations/Associations with other models
  belongs_to :chapter
  has_many :attachments, dependent: :destroy
  has_many :audit_items, dependent: :destroy
  has_many :audits, :through => :audit_items

  private
    def set_paragraph_number
      self.number = self.name.split(/[()]/)[1].upcase
    end
end
