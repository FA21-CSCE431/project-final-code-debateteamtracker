class Member < ApplicationRecord
    validates :email, presence: true
    validates :name, presence: true
    validates :points, presence: true
    validates :priority, presence: true
end
