class Member < ApplicationRecord
    validates :email, presence: true
    validates :name, presence: true
    validates :points, :numericality => { :greater_than_or_equal_to => 0 }, presence: true
    validates :priority, :numericality => { :greater_than_or_equal_to => 0 }, presence: true
    validates :priority, :numericality => { :less_than_or_equal_to => 3 }, presence: true

end
