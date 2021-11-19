# frozen_string_literal: true

json.extract! homepage, :id, :about, :aboutcontentone, :aboutcontenttwo, :emailone, :emailtwo, :emailthree, :emailfour,
              :emailfive, :contact, :contactcontent, :imageone, :imagetwo, :imagethree, :created_at, :updated_at
json.url homepage_url(homepage, format: :json)
