# frozen_string_literal: true

class Bookmark < ApplicationRecord
  include Taggable

  validates :url, presence: true
end
