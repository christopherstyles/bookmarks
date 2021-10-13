# frozen_string_literal: true

require "rails_helper"

RSpec.describe Bookmark, type: :model do
  let(:bookmark) { build_stubbed(:bookmark) }

  it { is_expected.to validate_presence_of(:url) }

  # TODO: Extract to a shared example set
  describe "#tag_list" do
    let(:bookmark) { create(:bookmark) }

    it "returns a list of tags" do
      tag = Tag.create(name: "potatoes")
      bookmark.tags << tag
      bookmark.reload
      expect(bookmark.tag_list).to eq("potatoes")
    end
  end

  describe "#tag_list=" do
    let(:bookmark) { create(:bookmark) }

    it "creates a list of tags" do
      bookmark.tag_list = "greens, vegetables"
      bookmark.save
      expect(bookmark.reload.tags.collect(&:name))
        .to eq(%w[greens vegetables])
    end
  end

  describe "after_save" do
    let(:bookmark) { build(:bookmark) }

    it "creates new tags" do
      bookmark.tag_list = "lentils, spicy"
      expect { bookmark.save }.to change(Tag, :count).by(2)
    end

    it "saves a given tag" do
      bookmark.tag_list = "lentils, spicy"
      bookmark.save
      expect(bookmark.reload.tags.collect(&:name)).to include("lentils")
    end

    it "removes old tags" do
      bookmark.tag_list = "lentils, spicy"
      bookmark.save
      bookmark.reload.tag_list = "spicy"
      bookmark.save
      expect(bookmark.reload.tags.collect(&:name)).not_to include("lentils")
    end
  end
end
