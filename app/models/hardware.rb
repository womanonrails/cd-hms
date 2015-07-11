# Hardware model
class Hardware < ActiveRecord::Base
  enum state: [:available, :occupied, :reserved, :damaged, :in_repair]
end
