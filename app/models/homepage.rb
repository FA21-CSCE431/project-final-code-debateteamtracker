# frozen_string_literal: true

# homepage validation
class Homepage < ApplicationRecord
  validate :about
  validate :aboutcontentone
  validate :aboutcontenttwo
  validate :emailone
  validate :emailtwo
  validate :emailthree
  validate :emailfour
  validate :emailfive
  validate :contact
  validate :contactcontent
  validate :imageone
  validate :imagetwo
  validate :imagethree
end
