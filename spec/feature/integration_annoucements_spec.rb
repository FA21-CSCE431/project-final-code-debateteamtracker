# location: spec/feature/integration_announcements_spec.rb
require 'rails_helper'

RSpec.describe 'Writing an announcement', type: :feature do
  scenario 'valid inputs' do
    visit new_announcement_path
    fill_in 'Title', with: 'Meeting Tomorrow!'
    fill_in 'Description', with: 'These are the details'
    fill_in 'Date', with: '12/12/2012'
    fill_in 'Author', with: 'president' 
    click_on 'New Announcement'
    visit announcements_path
    expect(page).to have_content('Meeting Tomorrow!')
    expect(page).to have_content('These are the details')
    expect(page).to have_content('2012-12-12')
    expect(page).to have_content('president')

  end
end