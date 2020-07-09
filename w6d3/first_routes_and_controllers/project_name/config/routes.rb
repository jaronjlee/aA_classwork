Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  
  resources :users, except: [:new, :edit] do
    resources :artworks, only: [:index] 
  end

  resources :artworks, except: [:index, :new, :edit]
  resources :artwork_shares, only: [:index, :create, :destroy]

  # get 'users', to: 'users#index', as: 'users'
  # get 'users/:id', to: 'users#show', as: 'user'
  # post 'users', to: 'users#create' 
  # # get 'users/new', to: 'users#new', as: 'new_users'
  # # get 'users/:id/edit', to: 'users#edit', as: 'edit_user'
  # patch 'users/:id', to: 'users#update'
  # put 'users/:id', to: 'users#update'
  # delete 'users/:id', to: 'users#destroy'

end

