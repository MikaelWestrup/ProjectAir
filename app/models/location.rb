# == Schema Information
#
# Table name: locations
#
#  id                 :integer          not null, primary key
#  name               :string(255)
#  country            :string(255)
#  airport            :string(255)
#  address            :text(65535)
#  zipcode            :string(255)
#  town               :string(255)
#  additional_details :text(65535)
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

class Location < ActiveRecord::Base
  # Validations for storing filtered data
  validates_presence_of :name, :country, :airport, :address, :zipcode, :town

  # Relations/Associations with other models
  has_many :audits #, dependent: :destroy
end
