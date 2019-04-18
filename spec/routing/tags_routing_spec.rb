require 'rails_helper'

RSpec.describe TagsController, type: :routing do
  describe 'routing' do
    it 'routes to #search' do
      expect(get: '/tags/search?q=rails,composition')
        .to route_to('tags#search', q: 'rails,composition')
    end
  end
end
