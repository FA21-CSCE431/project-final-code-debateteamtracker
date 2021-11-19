# frozen_string_literal: true

# points events model
class PointsEvent < ApplicationRecord
  validates :name, presence: true
  validates :value, presence: true

  has_many :participations
  has_many :members, through: :participations
end
