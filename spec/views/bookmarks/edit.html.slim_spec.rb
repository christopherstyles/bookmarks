# frozen_string_literal: true

require "rails_helper"

RSpec.describe "bookmarks/edit", type: :view do
  let!(:user) { assign(:user, create(:user)) }

  let!(:bookmark) do
    assign(
      :bookmark,
      create(:bookmark, user: user),
    )
  end

  it "renders the edit bookmark form" do
    render

    assert_select(
      "form[action=?][method=?]",
      bookmark_path(bookmark),
      "post",
    ) do
      assert_select "textarea[name=?]", "bookmark[url]"
    end
  end
end
