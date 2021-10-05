# location: spec/feature/integration_announcements.rb
require 'rails_helper'

RSpec.describe 'Testing Page Content', type: :feature do
  scenario 'valid inputs' do
    visit root_path
    expect(page).to have_content('Welcome Page')
  end
end