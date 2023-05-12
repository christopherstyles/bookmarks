# frozen_string_literal: true

require "rails_helper"

RSpec.describe Tagging, type: :model do
  let(:user) { create(:user) }
  let(:bookmark) { build(:bookmark, user: user) }

  describe "after_destroy" do
    it "removes unused tags" do
      bookmark.tag_list = "spicy, lentils, potatoes"
      bookmark.save
      bookmark.reload
      expect { bookmark.destroy }.to change(Tag, :count).by(-3)
    end
  end
end
