module ControllerMacros
  def login_user
    before(:each) do
      @request.env['devise.mapping'] = Devise.mappings[:user]
      user = FactoryGirl.create(:user)
      sign_in user
    end
  end
end

module RequestMacros
  def login_as_a_valid_user
    @user ||= FactoryGirl.create(:user)
    post_via_redirect user_session_path,
                      'user[email]' => @user.email,
                      'user[password]' => @user.password
  end
end
