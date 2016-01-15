# == Schema Information
#
# Table name: audit_items
#
#  id           :integer          not null, primary key
#  audit_id     :integer
#  paragraph_id :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class AuditItem < ActiveRecord::Base
  belongs_to :audit
  belongs_to :paragraph
end
