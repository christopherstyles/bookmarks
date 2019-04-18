Rails.application.routes.draw do
  resources :bookmarks do
    get :search, on: :collection
  end

  resources :unfurls, only: [:index]

  root to: 'bookmarks#new'
end
