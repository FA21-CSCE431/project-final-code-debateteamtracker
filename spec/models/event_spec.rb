require 'rails_helper'

RSpec.describe Event, type: :model do
  context 'validations' do  
    it 'ensures the presence of a name' do   #
      event = Event.new(name: "").save
      expect(event).to eq(false)
    end
    it 'ensures the presence of a location' do   #
      event = Event.new(location: "").save
      expect(event).to eq(false)
    end
    it 'ensures the presence of a date' do   #
      event = Event.new(date: "").save
      expect(event).to eq(false)
    end
    it 'ensures the presence of a description' do   #
      event = Event.new(description: "").save
      expect(event).to eq(false)
    end
    it 'ensures the presence of a time' do   #
      event = Event.new(time: "").save
      expect(event).to eq(false)
    end
  end
end
