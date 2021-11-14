# location: spec/feature/integration_groups_spec.rb
require 'rails_helper'

RSpec.describe 'Writing a group', type: :feature do
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
    visit new_group_path
    fill_in 'Title', with: 'Group 1'
    click_on 'Create Group'
    visit groups_path
    expect(page).to have_content('Group 1')
    click_on 'Edit'
    fill_in 'Title', with: 'Group 2'
    click_on 'Update Group'
    expect(page).to have_content('Group 2')
    click_on 'Back'
    expect(page).to have_content('Group 2')
    click_on 'Destroy'
    expect(page).to have_no_content('Group 2')
    


    
  end
end
