# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Bookmark management", type: :feature do
  let(:user) { create(:user) }

  before do
    sign_in(user)
  end

  it "enables me to create bookmarks" do
    visit new_bookmark_path
    fill_in "Url", with: Faker::Internet.url
    click_button "Create Bookmark"
    expect(page).to have_text("Bookmark was successfully created.")
  end
end
