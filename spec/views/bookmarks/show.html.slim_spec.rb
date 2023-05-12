# frozen_string_literal: true

require "rails_helper"

RSpec.describe "bookmarks/show", type: :view do
  let!(:user) { assign(:user, create(:user)) }

  before do
    @bookmark = assign(
      :bookmark,
      Bookmark.create!(
        url: "MyText",
        user: user,
      ),
    )
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/MyText/)
  end
end
