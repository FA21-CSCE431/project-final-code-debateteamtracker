require 'rails_helper'

RSpec.describe Event, type: :model do
  context 'before save' do  # (almost) plain English
    it 'must have name' do   #
      event = Event.new
      expect { event.save }.to raise_error(ActiveRecord::RecordInvalid)  # test code
    end
  end
end
