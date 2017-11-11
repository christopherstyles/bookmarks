require 'rails_helper'

RSpec.describe BookmarksController, type: :controller do
  let(:bookmark) { create(:bookmark) }
  let(:user) { create(:user) }

  before do
    sign_in_as(user)
  end

  describe 'GET #index' do
    it 'returns a success response' do
      get :index, params: {}
      expect(response).to be_success
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      get :show, params: { id: bookmark.to_param }
      expect(response).to be_success
    end
  end

  describe 'GET #new' do
    it 'returns a success response' do
      get :new, params: {}
      expect(response).to be_success
    end
  end

  describe 'GET #edit' do
    it 'returns a success response' do
      get :edit, params: { id: bookmark.to_param }
      expect(response).to be_success
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Bookmark' do
        expect {
          post :create, params: { bookmark: attributes_for(:bookmark) }
        }.to change(Bookmark, :count).by(1)
      end

      it 'redirects to the created bookmark' do
        post :create, params: { bookmark: attributes_for(:bookmark) }
        expect(response).to redirect_to(Bookmark.last)
      end
    end

    context 'with invalid params' do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: { bookmark: attributes_for(:bookmark, :invalid) }
        expect(response).to be_success
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) {
        { url: Faker::Internet.url }
      }

      it 'updates the requested bookmark' do
        bookmark
        put :update, params: { id: bookmark.to_param, bookmark: new_attributes }
        bookmark.reload
        expect(bookmark.url).to eq(new_attributes[:url])
      end

      it 'redirects to the bookmark' do
        bookmark
        put :update, params: {
          id: bookmark.to_param, bookmark: attributes_for(:bookmark)
        }
        expect(response).to redirect_to(bookmark)
      end
    end

    context 'with invalid params' do
      it "returns a success response (i.e. to display the 'edit' template)" do
        put :update, params: {
          id: bookmark.to_param, bookmark: attributes_for(:bookmark, :invalid)
        }
        expect(response).to be_success
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested bookmark' do
      bookmark
      expect {
        delete :destroy, params: { id: bookmark.to_param }
      }.to change(Bookmark, :count).by(-1)
    end

    it 'redirects to the bookmarks list' do
      bookmark
      delete :destroy, params: { id: bookmark.to_param }
      expect(response).to redirect_to(bookmarks_url)
    end
  end
end
