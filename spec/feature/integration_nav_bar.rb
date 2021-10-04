# location: spec/feature/integration_nav_bar.rb
require 'rails_helper'

RSpec.describe 'Visiting the Leaderboard page from the Index/Landing', type: :feature do
  scenario 'valid inputs' do
    visit root_path
    click_on 'Leaderboard'
    expect(page).to have_content('Leaderboard')
  end
end
