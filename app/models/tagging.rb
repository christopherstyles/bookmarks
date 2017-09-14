class Tagging < ApplicationRecord
  belongs_to :tag, counter_cache: true
  belongs_to :taggable, polymorphic: true

  after_destroy :remove_unused_tags

  private

  def remove_unused_tags
    tag.destroy if tag.reload.taggings_count.zero?
  end
end
