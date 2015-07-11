def encoded_service_token
  token = Rails.application.secrets.token
  ActionController::HttpAuthentication::Token.encode_credentials(token)
end
