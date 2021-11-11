# location: spec/feature/integration_member_spec.rb
require 'rails_helper'
 
RSpec.describe 'Creating a member', type: :feature do
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
        visit members_path
        expect(page).to have_content('Email')
        click_on 'New Member'
        expect(page).to(have_current_path(new_member_path))
        fill_in 'Email', with: 'bob@gmail.com'
        fill_in 'Name', with: 'Bob'
        fill_in 'Points', with: 0
        choose(1) # Choose radio button with value 1
        click_on 'Create Member'
        visit members_path
        expect(page).to have_content('bob@gmail.com')
        expect(page).to have_content('Bob')
        expect(page).to have_content(0)
    end
end
