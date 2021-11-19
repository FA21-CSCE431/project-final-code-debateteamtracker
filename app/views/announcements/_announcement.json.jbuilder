# frozen_string_literal: true

json.extract! announcement, :title, :description, :date, :author, :created_at, :updated_at
json.url announcement_url(announcement, format: :json)
