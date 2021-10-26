require 'rails_helper'

def login
    Rails.application.env_config["omniauth.auth"] = OmniAuth.config.mock_auth[:google]
    visit root_path
    click_link 'Sign in with Google'
end

RSpec.describe 'Authentications' do
    login
  end