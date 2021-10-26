class Group < ApplicationRecord
    has_many :members
    validates :email, presence: true
    validates :title, presence: true
end
