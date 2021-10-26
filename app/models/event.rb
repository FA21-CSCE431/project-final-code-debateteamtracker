class Event < ApplicationRecord
  validates :name, presence: true
  validates :location, presence: true
  validates :description, presence: true
  validates :date, presence: true
  validates :time, presence: true
end
