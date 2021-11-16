# location: spec/feature/integration_announcements_spec.rb
require 'rails_helper'

RSpec.describe 'Writing an announcement', type: :feature do
  before(:each) do
    @admin = Admin.create(email: 'admin@gmail.com')
    sign_in @admin
  end
  def make_admin
      if Member.where(email: 'admin@gmail.com', priority: 3, points: 0, name: 'admin').first.nil?
        Member.create!(email: 'admin@gmail.com', priority: 3, points: 0, name: 'admin')
      end
  end
  def make_group
    if Group.where(title: 'group1').first.nil?
      Group.create!(title:'group1')
    end
  end
  scenario 'valid inputs' do
    make_admin
    make_group
    visit new_announcement_path
    fill_in 'Title', with: 'Meeting Tomorrow!'
    fill_in 'Description', with: 'These are the details'
    fill_in 'Date', with: '12/12/2012'
    fill_in 'Author', with: 'president'
    click_on 'Create Announcement'
    # Default Group is chosen
    visit announcements_path
    expect(page).to have_content('Meeting Tomorrow!')
    expect(page).to have_content('These are the details')
    expect(page).to have_content('2012-12-12')
    expect(page).to have_content('president')

  end
end