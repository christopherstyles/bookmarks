# frozen_string_literal: true

class CreateTags < ActiveRecord::Migration[5.1]
  def change
    create_table :tags, id: :uuid do |t|
      t.string :name, null: false
      t.integer :taggings_count, default: 0

      t.timestamps
    end

    add_index :tags, :name, unique: true
  end
end
