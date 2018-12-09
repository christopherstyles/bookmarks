Rails.application.routes.draw do
  resources :bookmarks do
    get :search, on: :collection
  end

  root to: 'bookmarks#new'
end
