# spec/features/integration_events_spec.rb

require 'rails_helper'

RSpec.describe 'Creating an event', type: :feature do
  scenario 'valid inputs' do
    visit new_event_path
    fill_in 'Name', with: 'GBM'
    fill_in 'Location', with: 'Rudder'
    fill_in 'Date', with: '10/25/2021'
    fill_in 'Time', with: '09:26'
    fill_in 'Description', with: 'First Meeting'
    click_on 'Create Event'
    visit new_event_path
    expect(page).to have_content('GBM')
    expect(page).to have_content('Rudder')
    expect(page).to have_content('10/25/2021')
    expect(page).to have_content('09:26')
    expect(page).to have_content('First Meeting')
  end
end