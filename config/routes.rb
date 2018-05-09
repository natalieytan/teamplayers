Rails.application.routes.draw do
  root 'static#index'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  root 'static#index'
  resources :profiles, only: [:create, :show]
  get '/myprofile', to: 'profiles#own'
  get '/myprofile/edit', to: 'profiles#edit'
  patch '/myprofile', to: 'profiles#update'
  resources :interests
  resources :teams do
    resources :team_applications, shallow: true
    resources :team_players, shallow: true, except: [:create, :new]
  end
  get '/myapplications', to: 'team_applications#own'

end
