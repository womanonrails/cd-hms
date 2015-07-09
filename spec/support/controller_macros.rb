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
    allow_any_instance_of(ApplicationController).to receive(
      :authenticate_user!
    ).and_return(true)
  end
end
