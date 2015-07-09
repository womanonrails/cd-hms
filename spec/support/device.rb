RSpec.configure do |config|
  config.include Devise::TestHelpers, type: :controller
  config.include RequestMacros, type: :request
  config.extend ControllerMacros, type: :controller
end
