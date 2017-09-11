class Bookmark < ApplicationRecord
  validates :url, presence: true
end
