# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Bookmarks", type: :request do
  let(:user) { create(:user) }

  before do
    sign_in(user)
  end

  describe "GET /bookmarks" do
    it "displays bookmarks" do
      bookmark1 = create(:bookmark, user: user)
      bookmark2 = create(:bookmark, user: user)

      get bookmarks_path

      expect(response).to have_http_status(:ok)

      assert_select "a", text: bookmark1.url
      assert_select "a", text: bookmark2.url
    end

    it "displays search results" do
      tag1 = create(:tag, name: "rubyonrails")
      tag2 = create(:tag, name: "composition")

      bookmark1 = create(:bookmark, user: user)
      bookmark2 = create(:bookmark, user: user)

      create(
        :tagging, taggable: bookmark1,
                  tag: tag1,
      )
      create(
        :tagging, taggable: bookmark1,
                  tag: tag2,
      )

      create(
        :tagging, taggable: bookmark2,
                  tag: tag1,
      )
      create(
        :tagging, taggable: bookmark2,
                  tag: tag2,
      )

      get search_bookmarks_path(q: "rubyonrails,composition", as: user)

      expect(response).to have_http_status(:ok)

      assert_select "a", text: bookmark1.url
      assert_select "a", text: bookmark2.url
    end
  end
end
