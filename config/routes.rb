# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?

  resources :bookmarks do
    get :search, on: :collection
  end

  resources :tags, only: [] do
    get :search, on: :collection
  end

  resources :unfurls, only: [:index]

  root to: "bookmarks#new"

  get "/health", to: proc { [200, {}, ["OK"]] }
end
