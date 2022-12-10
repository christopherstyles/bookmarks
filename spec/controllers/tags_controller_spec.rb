# frozen_string_literal: true

require "rails_helper"

RSpec.describe TagsController, type: :controller do
  let(:tag) { create(:tag) }
  let(:user) { create(:user) }

  before do
    sign_in(user)
  end

  describe "GET #search" do
    it "returns a success response" do
      get :search, params: {}
      expect(response).to be_successful
    end

    context "with a query parameter" do
      it "returns tags as json" do
        tag_rails = create(:tag, name: "rails")

        get :search, params: { q: "ra" }
        expect(response.body).to eq({ tags: [tag_rails] }.to_json)
      end
    end
  end
end
