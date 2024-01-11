Rails.application.routes.draw do
  devise_for :users
  resources :users
  # get 'gamen2/index'
  # get 'top/index'
  # resources :tasks

  # resources :progress_data
  # resources :users
  # root 'progress_data#index'

  # resources :tasks, only: [:index, :new, :create, :edit, :update, :destroy]
  patch '/tasks/:id/update_progress', to: 'tasks#update_progress', as: 'update_progress'

  resources :tasks do
    get 'detail', on: :member
  end
  resources :tasks
  # root 'tasks#index'
  root :to => 'tasks#index'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
