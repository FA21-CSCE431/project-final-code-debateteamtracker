# location: spec/feature/integration_points_events_spec.rb
require 'rails_helper'

RSpec.describe 'Writing a points event', type: :feature do
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
    visit points_events_path
    expect(page).to have_content('Points Events')
    #visit new_points_event_path
    click_on 'New Points Event'
    fill_in 'Name', with: 'Debate 1'
    fill_in 'Value', with: '5'

    click_on 'Create Points event'
    visit points_events_path
    expect(page).to have_content('Debate 1')
    expect(page).to have_content('5')
    click_on 'New Points Event'
    fill_in 'Name', with: 'Debate 2'
    fill_in 'Value', with: '7'

    visit points_events_path
    click_on 'Edit'
    fill_in 'Value', with: '10'
    click_on 'Update Points event'
    expect(page).to have_content('Debate 1')
    expect(page).to have_content('10')

    visit points_events_path
    click_on 'Delete'
    expect(page).to have_no_content('Debate 1')
    expect(page).to have_no_content('10')

  end
end
