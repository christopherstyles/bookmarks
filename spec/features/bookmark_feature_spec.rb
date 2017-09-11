require 'rails_helper'

RSpec.describe 'Bookmark management', type: :feature do
  it 'enables me to create bookmarks' do
    visit '/bookmarks/new'
    fill_in 'Url', with: Faker::Internet.url
    click_button 'Create Bookmark'
    expect(page).to have_text('Bookmark was successfully created.')
  end
end
