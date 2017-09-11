require 'rails_helper'

RSpec.describe 'bookmarks/show', type: :view do
  before do
    @bookmark = assign(:bookmark, Bookmark.create!(
                                    url: 'MyText',
    ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/MyText/)
  end
end
