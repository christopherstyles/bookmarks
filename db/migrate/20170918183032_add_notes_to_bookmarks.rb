class AddNotesToBookmarks < ActiveRecord::Migration[5.1]
  def change
    add_column :bookmarks, :notes, :text
  end
end
