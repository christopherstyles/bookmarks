# frozen_string_literal: true

class CreateBookmarks < ActiveRecord::Migration[5.1]
  def change
    create_table :bookmarks, id: :uuid do |t|
      t.text :url, null: false

      t.timestamps
    end
  end
end
