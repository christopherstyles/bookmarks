require 'rails_helper'

RSpec.describe 'bookmarks/index', type: :view do
  before do
    assign(:bookmarks, [
             Bookmark.create!(
               url: 'MyText',
             ),
             Bookmark.create!(
               url: 'MyText',
             ),
           ])
  end

  it 'renders a list of bookmarks' do
    render
    assert_select 'tr>td', text: 'MyText'.to_s, count: 2
  end
end
