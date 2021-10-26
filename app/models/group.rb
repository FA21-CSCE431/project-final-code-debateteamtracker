class Group < ApplicationRecord
    validates :email, presence: true
    validates :title, presence: true
    has_many :member_groups
    has_many :members, :through => :member_groups
end
