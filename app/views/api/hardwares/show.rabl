object @hardware
attributes :id,  :name, :length, :width, :height, :weight, :serial_numver,
           :price, :status, :note, :warranty_expired_on

child :location do
  extends 'api/location/show'
end
