Rails.application.routes.draw do
  resources :bookmarks
  
  root to: 'bookmarks#index'
end
