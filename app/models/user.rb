class User < ActiveRecord::Base
  devise :omniauthable, omniauth_providers: [:google_oauth2]

  def self.from_omniauth(access_token)
    email = access_token.info['email']
    domain = "@#{Rails.application.secrets.domain}"
    return unless email.include?(domain)
    User.where(email: email).first_or_create
  end
end
