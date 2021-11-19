# frozen_string_literal: true

# member group join table model
class MemberGroup < ApplicationRecord
  belongs_to  :member
  belongs_to  :group
end
