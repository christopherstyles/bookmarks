require 'active_support/concern'

module Taggable
  extend ActiveSupport::Concern

  included do
    has_many :taggings, -> { includes(:tag).order(:created_at) },
             as: :taggable,
             dependent: :destroy

    has_many :tags, through: :taggings

    after_save :save_tags

    attr_writer :tag_list

    def tag_list
      @tag_list = tags.map(&:name).join(', ')
    end

    def save_tags
      self.tags = @tag_list.to_s.split(',').map do |tag_name|
        Tag.find_or_create_by!(name: tag_name.strip)
      end
    end
  end
end
