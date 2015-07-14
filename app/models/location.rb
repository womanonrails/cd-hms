# Location details
class Location < ActiveRecord::Base
  has_many :hardwares, dependent: :restrict_with_error
end
