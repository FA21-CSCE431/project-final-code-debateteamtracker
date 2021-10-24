# location: spec/unit/members.rb
require 'rails_helper'

RSpec.describe Member, type: :model do
  subject do
    described_class.new(email: "jaym00@tamu.edu", name: 'Jayaharini Maheswaran', points: 5, priority: 1)
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without an email' do
    subject.email = nil
    expect(subject).not_to be_valid
  end

  it 'is not valid without a name' do
    subject.name = nil
    expect(subject).not_to be_valid
  end

  it 'is not valid without a points' do
    subject.points = nil
    expect(subject).not_to be_valid
  end

  it 'is not valid without a priority' do
    subject.priority = nil
    expect(subject).not_to be_valid
  end
  
end