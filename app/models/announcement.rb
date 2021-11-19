# frozen_string_literal: true

# announcement entity model
class Announcement < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true
  validates :date, presence: true
  validates :author, presence: true

  has_many :member_groups
  has_many :groups
  has_many :members
end
