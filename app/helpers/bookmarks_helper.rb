# frozen_string_literal: true

module BookmarksHelper
  def options_for_tags
    Tag.order(name: :asc).all.map do |tag|
      {id: tag.id, name: tag.name}
    end
  end
end
