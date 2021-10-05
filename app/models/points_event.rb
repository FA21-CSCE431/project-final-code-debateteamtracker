class PointsEvent < ApplicationRecord
  validates :name, presence:true
  validates :value, presence:true
end
