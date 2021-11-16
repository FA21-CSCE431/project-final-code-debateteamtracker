# location: spec/unit/unit_homepage_spec.rb
require 'rails_helper'

RSpec.describe Homepage, type: :model do
  subject do
    described_class.new(about: 'about content', aboutcontentone: 'this is also placeholder', aboutcontenttwo: 'this is placeholder', emailone:'bonjour@gmail.com', emailtwo:'yo@gmail.com', emailthree:'howdee@gmail.com', emailfour:'hello@gmail.com', emailfive:'hola@gmail.com', contact:'sample', contactcontent:'placeholder', imageone:'url1', imagetwo:'url2', imagethree:'url3')
  end


  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is valid about' do
    expect(subject).to be_valid
  end

  it 'is valid about' do
    subject.about = nil
    expect(subject).to be_valid
  end

  it 'is valid contentone' do
    subject.aboutcontentone = nil
    expect(subject).to be_valid
  end

  it 'is valid contenttwo' do
    subject.aboutcontenttwo = nil
    expect(subject).to be_valid
  end

  it 'is valid emailone' do
    subject.emailone = nil
    expect(subject).to be_valid
  end

end