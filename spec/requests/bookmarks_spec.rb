require 'rails_helper'

RSpec.describe 'Bookmarks', type: :request do
  let(:user) { create(:user) }

  describe 'GET /bookmarks' do
    it 'displays bookmarks' do
      bookmark1 = create(:bookmark)
      bookmark2 = create(:bookmark)

      get bookmarks_path(as: user)

      expect(response).to have_http_status(:ok)

      assert_select '.bookmark' do
        assert_select '.bookmark__url', bookmark1.url
        assert_select '.bookmark__url', bookmark2.url
      end
    end

    it 'displays search results' do
      tag1 = create(:tag, name: 'rubyonrails')
      tag2 = create(:tag, name: 'composition')

      bookmark1 = create(:bookmark)
      bookmark2 = create(:bookmark)

      create(
        :tagging, taggable: bookmark1,
                  tag: tag1
      )

      create(
        :tagging, taggable: bookmark2,
                  tag: tag2
      )

      get search_bookmarks_path(q: 'rubyonrails,composition', as: user)

      expect(response).to have_http_status(:ok)

      assert_select '.bookmark' do
        assert_select '.bookmark__url', bookmark1.url
        assert_select '.bookmark__url', bookmark2.url
      end
    end
  end
end
