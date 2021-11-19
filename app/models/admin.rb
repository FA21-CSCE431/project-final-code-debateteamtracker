# frozen_string_literal: true

# admin model
class Admin < ApplicationRecord
  devise :omniauthable, omniauth_providers: [:google_oauth2]

  def self.from_google(email:, full_name:, uid:, avatar_url:)
    create_with(uid: uid, full_name: full_name, avatar_url: avatar_url).find_or_create_by!(email: email)
  end

  def authenticate_mem
    if Member.exists?(['email LIKE ?', "%#{current_admin.email}"])
      true
    else
      false
    end
  end
end
