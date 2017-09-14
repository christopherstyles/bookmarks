require 'rails_helper'

RSpec.describe Tagging, type: :model do
  let(:bookmark) { build(:bookmark) }

  describe 'after_destroy' do
    it 'removes unused tags' do
      bookmark.tag_list = 'spicy, lentils, potatoes'
      bookmark.save
      bookmark.reload
      expect { bookmark.destroy }.to change(Tag, :count).by(-3)
    end
  end
end
