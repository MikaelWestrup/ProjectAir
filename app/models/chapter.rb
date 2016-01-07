# == Schema Information
#
# Table name: chapters
#
#  id            :integer          not null, primary key
#  name          :text(65535)
#  ctype         :string(255)
#  annex         :string(255)
#  code          :string(255)
#  regulation_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Chapter < ActiveRecord::Base
  # Validations for storing filtered data
  validates_presence_of :name, :ctype, :annex, :code, :regulation

  # Relations/Associations with other models
  belongs_to :regulation
  has_many :paragraphs
end
