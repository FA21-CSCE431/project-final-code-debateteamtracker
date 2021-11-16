require 'rails_helper'

RSpec.describe 'Adding Information on Homepage', type: :feature do
  scenario 'valid inputs' do
    visit new_homepage_path
    fill_in 'About Section Title', with: 'About Us'
    fill_in 'About Content', with: 'Filler Text'
    fill_in 'About Additional Content', with: 'Additional Filler Text'
    fill_in 'Image Carousel URL One', with: 'Image One'
    fill_in 'Image Carousel URL Two', with: 'Image Two'
    fill_in 'Image Carousel URL Three', with: 'Image Three'
    fill_in 'Contact Section Title', with: 'Contact Title'
    fill_in 'Contact Section Content', with: 'Contact Content'
    fill_in 'Email One', with: 'Email One'
    fill_in 'Email Two', with: 'Email Two'
    fill_in 'Email Three', with: 'Email Three'
    fill_in 'Email Four', with: 'Email Four'
    fill_in 'Email Five', with: 'Email Five'
    click_on 'Create Homepage'
    visit homepages_path
    expect(page).to have_content('About Us')
    expect(page).to have_content('Filler Text')
    expect(page).to have_content('Additional Filler Text')
    expect(page).to have_content('Image One')
    expect(page).to have_content('Image Two')
    expect(page).to have_content('Image Three')
    expect(page).to have_content('Contact Title')
    expect(page).to have_content('Contact Content')
    expect(page).to have_content('Email One')
    expect(page).to have_content('Email Two')
    expect(page).to have_content('Email Three')
    expect(page).to have_content('Email Four')
    expect(page).to have_content('Email Five')

    

    visit homepages_path
    click_on 'Edit'
    fill_in 'About Section Title', with: 'About Us1'
    fill_in 'About Content', with: 'Filler Text1'
    fill_in 'About Additional Content', with: 'Additional Filler Text1'
    fill_in 'Image Carousel URL One', with: 'Image One1'
    fill_in 'Image Carousel URL Two', with: 'Image Two1'
    fill_in 'Image Carousel URL Three', with: 'Image Three1'
    fill_in 'Contact Section Title', with: 'Contact Title1'
    fill_in 'Contact Section Content', with: 'Contact Content1'
    fill_in 'Email One', with: 'Email One1'
    fill_in 'Email Two', with: 'Email Two1'
    fill_in 'Email Three', with: 'Email Three1'
    fill_in 'Email Four', with: 'Email Four1'
    fill_in 'Email Five', with: 'Email Five1'
    click_on 'Update Homepage'
    visit homepages_path
    expect(page).to have_content('About Us1')
    expect(page).to have_content('Filler Text1')
    expect(page).to have_content('Additional Filler Text1')
    expect(page).to have_content('Image One1')
    expect(page).to have_content('Image Two1')
    expect(page).to have_content('Image Three1')
    expect(page).to have_content('Contact Title1')
    expect(page).to have_content('Contact Content1')
    expect(page).to have_content('Email One1')
    expect(page).to have_content('Email Two1')
    expect(page).to have_content('Email Three1')
    expect(page).to have_content('Email Four1')
    expect(page).to have_content('Email Five1')

    visit homepages_path
    click_on 'Destroy'
    expect(page).to have_no_content('About Us1')
    expect(page).to have_no_content('Filler Text1')
    expect(page).to have_no_content('Additional Filler Text1')
    expect(page).to have_no_content('Image One1')
    expect(page).to have_no_content('Image Two1')
    expect(page).to have_no_content('Image Three1')
    expect(page).to have_no_content('Contact Title1')
    expect(page).to have_no_content('Contact Content1')
    expect(page).to have_no_content('Email One1')
    expect(page).to have_no_content('Email Two1')
    expect(page).to have_no_content('Email Three1')
    expect(page).to have_no_content('Email Four1')
    expect(page).to have_no_content('Email Five1')

  end
end