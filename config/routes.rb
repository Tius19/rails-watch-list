Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: 'lists#index'
  resources :lists, except: %i[edit update] do
    resources :bookmarks, only: %i[create new]
    resources :reviews, only: :create
  end
  resources :bookmarks, only: :destroy
  resources :reviews, only: :destroy
end
  # get 'lists', to: 'lists#index'

  # get 'lists/new', to: 'lists#new', as: 'new_list'
  # post 'lists', to: 'lists#create'

  # get 'lists/:id', to: 'lists#show', as: 'list'
