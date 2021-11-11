# spec/features/integration_events_spec.rb

require 'rails_helper'

RSpec.describe 'Creating an event', type: :feature do
  before(:each) do
    @admin = Admin.create(email: 'admin@gmail.com')
    sign_in @admin
  end
  def make_admin
    if Member.where(email: 'admin@gmail.com', priority: 3, points: 0, name: 'admin').first.nil?
      Member.create!(email: 'admin@gmail.com', priority: 3, points: 0, name: 'admin')
    end
  end
  scenario 'valid inputs' do
    make_admin
    visit new_event_path
    fill_in 'Name', with: 'GBM'
    fill_in 'Location', with: 'Rudder'
    fill_in 'Start', with: '2021-02-02 01:00:00 UTC'
    fill_in 'End', with: '2021-02-02 02:00:00 UTC'
    fill_in 'Description', with: 'Debate about Rails'
    click_on 'Create Event'
    visit events_path
    expect(page).to have_content('GBM')
    expect(page).to have_content('Rudder')
    expect(page).to have_content('2021-02-02 01:00:00 UTC')
    expect(page).to have_content('2021-02-02 02:00:00 UTC')
    expect(page).to have_content('Debate about Rails')
  end
end