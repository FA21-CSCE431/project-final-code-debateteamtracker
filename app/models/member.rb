class Member < ApplicationRecord
    validates :email, presence: true
    validates :name, presence: true
    validates :points, presence: true
    validates :priority, presence: true

    belongs_to :announcements
    has_many :member_groups
    has_many :groups, :through => :member_groups
end
