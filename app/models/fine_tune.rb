# == Schema Information
#
# Table name: fine_tunes
#
#  id           :integer          not null, primary key
#  ddate        :date
#  start_hour   :time
#  end_hour     :time
#  notes        :text(65535)
#  audit_id     :integer
#  paragraph_id :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class FineTune < ActiveRecord::Base
  # Validations for storing filtered data
  validates_presence_of :ddate, :start_hour, :end_hour, :audit_id, :paragraph_id

  # Relations/Associations with other models
  belongs_to :paragraph
  belongs_to :audit
end
