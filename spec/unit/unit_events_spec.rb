# location: spec/unit/unit_events_spec.rb
require 'rails_helper'

RSpec.describe Event, type: :model do
  event do
    described_class.new(name: 'GBM', location: 'Rudder', date: '10/25/2021',  time: '09:26', description:'First Meeting' )
  end

  it 'is valid with valid attributes' do
    expect(event).to be_valid
  end

  it 'is not valid without a name' do
    event.name = nil
    expect(event).not_to be_valid
  end
  it 'is not valid without a location' do
    event.location = nil
    expect(event).not_to be_valid
  end
  it 'is not valid without a date' do
    event.date = nil
    expect(event).not_to be_valid
  end
  it 'is not valid without a time' do
    event.time = nil
    expect(event).not_to be_valid
  end
  it 'is not valid without a description' do
    event.description = nil
    expect(event).not_to be_valid
  end
end
