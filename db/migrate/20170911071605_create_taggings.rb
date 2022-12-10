# frozen_string_literal: true

class CreateTaggings < ActiveRecord::Migration[5.1]
  def change
    create_table :taggings, id: :uuid do |t|
      t.references :tag, null: false, index: true, foreign_key: { on_delete: :cascade }, type: :uuid

      t.string :taggable_type, null: false
      t.uuid :taggable_id, null: false

      t.timestamps
    end
  end
end
