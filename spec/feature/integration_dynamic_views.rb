require 'rails_helper'

RSpec.describe 'Creating a member', type: :feature do
    before(:each) do
        @admin = Admin.create(email: 'admin@gmail.com')
        # sign_in @admin
        @member = Admin.create(email: 'member@gmail.com')
        # sign_in @memer
    end
    def make_admin
        if Member.where(email: 'admin@gmail.com', priority: 3, points: 0, name: 'admin').first.nil?
          Member.create!(email: 'admin@gmail.com', priority: 3, points: 0, name: 'admin')
        end
    end
    def make_member
        if Member.where(email: 'member@gmail.com', priority: 1, points: 0, name: 'member').first.nil?
          Member.create!(email: 'member@gmail.com', priority: 1, points: 0, name: 'member')
        end
    end
    scenario 'Admin view' do
        sign_in @admin
        make_admin
        visit profile_index_path
       
        # Nav bar        
        expect(page).to have_content('Home')
        expect(page).to have_content('Leaderboard')
        expect(page).to have_content('Announcements')
        expect(page).to have_content('Calendar')
        expect(page).to have_content('Profile')
        expect(page).to have_content('Members')

        # Page content
        expect(page).to have_content('Admin Overview')
    end

    scenario 'Member view' do
        sign_in @member
        make_member
        visit profile_index_path
        # Nav bar
        expect(page).to have_content('Home')
        expect(page).to have_content('Leaderboard')
        expect(page).to have_content('Announcements')
        expect(page).to have_content('Calendar')
        expect(page).to have_content('Profile')
        expect(page).not_to have_content('Members')
        
        # Page content
        expect(page).to have_content('Your total Points:')
    end
end