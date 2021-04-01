Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only:[:index, :create, :show, :update, :destroy] do
    resources :artworks, only: [:index, :show, :update]
    resources :comments, only: [:index]
    member do 
      get 'favorites'
    end
    resources :collections, only:[:index]

  end
  resources :artworks, only:[:index, :create, :show, :update, :destroy] do
    resources :comments, only: :index
  end

  resources :artwork_shares, only:[:create, :destroy]


  resources :comments, only:[:index, :create, :destroy]

  resources :collections, only:[:index, :show, :create, :destroy] do
    resources :artworks, only: [:index]
  end

  resources :collection_artworks, only: [:index, :create, :destroy]
end

