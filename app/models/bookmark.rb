class Bookmark < ApplicationRecord
  include Taggable

  validates :url, presence: true
end
