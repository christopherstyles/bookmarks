# frozen_string_literal: true

require "rails_helper"

RSpec.describe "bookmarks/new", type: :view do
  before do
    assign(:bookmark, Bookmark.new(
                        url: "MyText",
                      ),)
  end

  it "renders new bookmark form" do
    render

    assert_select "form[action=?][method=?]", bookmarks_path, "post" do
      assert_select "textarea[name=?]", "bookmark[url]"
    end
  end
end
