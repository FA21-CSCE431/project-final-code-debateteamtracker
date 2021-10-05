# location: spec/unit/unit_announcemnts.rb
require 'rails_helper'

RSpec.describe PointsEvent, type: :model do
  subject do
    described_class.new(name: 'Debate 1', value:1)
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a name' do
    subject.name = nil
    expect(subject).not_to be_valid
  end
  it 'is not valid without a value' do
    subject.value = nil
    expect(subject).not_to be_valid
  end
end
