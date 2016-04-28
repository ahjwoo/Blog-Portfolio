Rails.application.routes.draw do
  devise_for :users
  resources :posts
  resources :projects
  resources :contacts, only: [:new, :create]
  resources :welcome, only: [:index, :new, :create]

  root 'welcome#index'

  get '*path' => redirect('/')
  # For any routing error, will redirect to homepage!
end
