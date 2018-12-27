require 'rails_helper'

RSpec.describe 'bookmarks/index', type: :view do
  let(:title) { Faker::Lorem.sentence }
  let!(:bookmark1) { create(:bookmark, title: title) }
  let!(:bookmark2) { create(:bookmark, title: title) }

  before do
    assign(:bookmarks, [bookmark1, bookmark2])
    assign(:pagy, Pagy.new(count: 100, page: 4))
  end

  it 'renders a list of bookmarks' do
    render
    assert_select '.bookmark__title', text: title, count: 2
  end
end
