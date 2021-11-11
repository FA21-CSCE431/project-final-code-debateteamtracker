class Member < ApplicationRecord
    validates :email, presence: true
    validates :name, presence: true
    has_many :member_groups
    has_many :groups, :through => :member_groups
    validates :points, :numericality => { :greater_than_or_equal_to => 0 }, presence: true
    validates :priority, :numericality => { :greater_than_or_equal_to => 0 }, presence: true
    validates :priority, :numericality => { :less_than_or_equal_to => 3 }, presence: true
    
    has_many :participations
    has_many :points_events, :through => :participations

end
