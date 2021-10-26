# location: spec/unit/unit_groups.rb
require 'rails_helper'

RSpec.describe Group, type: :model do
  subject do
    described_class.new(title: 'Debate 1', email:'email@email.com')
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a title' do
    subject.title = nil
    expect(subject).not_to be_valid
  end
  it 'is not valid without a email' do
    subject.email = nil
    expect(subject).not_to be_valid
  end
end