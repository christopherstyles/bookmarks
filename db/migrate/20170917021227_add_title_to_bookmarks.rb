class AddTitleToBookmarks < ActiveRecord::Migration[5.1]
  def change
    add_column :bookmarks, :title, :string
  end
end
