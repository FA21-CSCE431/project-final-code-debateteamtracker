# location: spec/unit/unit_announcemnts_spec.rb
require 'rails_helper'

RSpec.describe Announcement, type: :model do
  subject do
    described_class.new(title: 'Meeting Tommorow', description:'details', date: '2012-12-12', author: 'president')
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a title' do
    subject.title = nil
    expect(subject).not_to be_valid
  end
  it 'is not valid without a description' do
    subject.description = nil
    expect(subject).not_to be_valid
  end
  it 'is not valid without a date' do
    subject.date = nil
    expect(subject).not_to be_valid
  end
  it 'is not valid without a author' do
    subject.author = nil
    expect(subject).not_to be_valid
  end
end
