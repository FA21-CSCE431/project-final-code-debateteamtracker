# location: spec/feature/integration_member_spec.rb
require 'rails_helper'
 
RSpec.describe 'Creating a member', type: :feature do
    scenario 'valid inputs' do
    # visit root_path
    # click_on 'Member Create'
    # visit new_member_path
    # fill_in 'member_email', with: 'bob@gmail.com'
    # fill_in 'member_name', with: 'Bob'
    # fill_in 'member_points', with: 0
    # fill_in 'Priority', with: 3
    # click_on 'Create Member'
    # visit members_path
    # expect(page).to have_content('bob@gmail.com')
    # expect(page).to have_content('Bob')
    # expect(page).to have_content(0)
    # expect(page).to have_content(3)

    # Rails.application.env_config["omniauth.auth"] = OmniAuth.config.mock_auth[:google]
    # visit root_path
    # click_link 'Sign in with Google'

    visit new_member_path
    fill_in 'Email', with: 'bob@gmail.com'
    fill_in 'Name', with: 'Bob'
    fill_in 'Points', with: 0
    fill_in 'Priority', with: 3
    click_on 'Create Member'
    visit members_path
    expect(page).to have_content('bob@gmail.com')
    expect(page).to have_content('Bob')
    expect(page).to have_content(0)
    expect(page).to have_content(3)
    end
end
