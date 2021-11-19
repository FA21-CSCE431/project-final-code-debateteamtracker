# frozen_string_literal: true

# participation
class Participation < ApplicationRecord
  belongs_to :member
  belongs_to :points_event
end
