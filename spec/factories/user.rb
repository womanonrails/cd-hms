FactoryGirl.define do
  factory :user do
    email 'john@example.com'
    password 'secret123'
    password_confirmation 'secret123'
  end
end
