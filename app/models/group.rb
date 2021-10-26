class Group < ApplicationRecord
    validates :title, presence: true
    has_many :member_groups
    has_many :members, :through => :member_groups
    belongs_to :announcements
end
