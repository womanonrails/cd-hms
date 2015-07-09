# Hardware model
class Hardware < ActiveRecord::Base
  enum status: [:available, :occupied, :reserved, :damaged, :in_repair]
end
