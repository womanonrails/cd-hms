json.array!(@hardwares) do |hardware|
  json.extract! hardware, :id, :name, :length, :width, :height, :weight, :serial_number, :price, :status, :warranty_expired_on
  json.url hardware_url(hardware, format: :json)
end
