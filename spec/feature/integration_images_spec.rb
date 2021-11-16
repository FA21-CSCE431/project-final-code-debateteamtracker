# location: spec/feature/integration_announcements_spec.rb
require 'rails_helper'

RSpec.describe 'Uploading an image', type: :feature do
  scenario 'valid inputs' do
    visit new_image_path
    expect(page).to have_content('New image')
    fill_in 'Name', with: 'Test image'
    # file = fixture_file_upload(Rails.root.join('public', 'apple-touch-icon.png'), 'image/png')
    # expect {
		#     post :create, params: { post: { image: file } }
    # }.to change(ActiveStorage::Attachment, :count).by(1)
    click_on 'Create Image'
    visit images_path
    expect(page).to have_content('Name')
  end
end
