# location: spec/feature/integration_groups_spec.rb
require 'rails_helper'

RSpec.describe 'Writing a group', type: :feature do
  scenario 'valid inputs' do
    visit new_group_path
    fill_in 'Title', with: 'Group 1'
    click_on 'New Group'
    visit groups_path
    expect(page).to have_content('Group 1')
  end
end
