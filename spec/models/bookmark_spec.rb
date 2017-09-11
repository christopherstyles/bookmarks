require 'rails_helper'

RSpec.describe Bookmark, type: :model do
  let(:bookmark) { build_stubbed(:bookmark) }

  it { is_expected.to validate_presence_of(:url) }
end
