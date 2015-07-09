FactoryGirl.define do
  factory :hardware do
    name 'Computer'
    length 120
    width 90
    height 70
    weight 12
    serial_number 'abcd1234'
    price 1200
    status 0
  end
end
