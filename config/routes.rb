Rails.application.routes.draw do

  resources :charges, only: [:new, :create]

  get 'downgrade' => 'charges#downgrade'

  resources :wikis

  get 'about' => 'welcome#about'

  get 'home' => 'welcome#index'

  root to: 'welcome#index'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
