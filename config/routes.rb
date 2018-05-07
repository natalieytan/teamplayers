Rails.application.routes.draw do
  root 'static#index'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  root 'static#index'
  get '/profile', to: 'profiles#own'
  get '/profile/edit', to: 'profiles#edit'
  patch '/profile', to: 'profiles#update'
  resources :profiles, only: [:create, :show]
  resources :interests
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
