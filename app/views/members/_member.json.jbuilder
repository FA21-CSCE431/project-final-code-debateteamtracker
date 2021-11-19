# frozen_string_literal: true

json.extract! member, :id, :email, :name, :points, :priority, :created_at, :updated_at
json.url member_url(member, format: :json)
