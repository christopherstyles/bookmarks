# frozen_string_literal: true

class Bookmark < ApplicationRecord
  include Taggable

  belongs_to :user

  validates :url, presence: true
end
