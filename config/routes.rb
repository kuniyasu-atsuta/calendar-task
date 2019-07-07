# frozen_string_literal: true

Rails.application.routes.draw do
  root 'pages#landing'
  get 'calendar', to: 'pages#calendar'
  get 'profile/:id', to: 'extras#profile'
  get 'password_resets/new'
  get 'password_resets/edit'
  resources :password_resets, only: %i[new create edit update]

  get '/help', to: 'pages#help'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  # get 'users/index/:id', to: 'users#index'
  get '/ranking/:id', to: 'users#ranking'
  get '/users/edit', to: 'users#edit'
  resources :users, except: [:index] do
    member do
      get :lessons
    end
  end

  get '/lessons/:id', to: 'lessons#index'
for i in (1..20)
  get "/lessons/:id/#{i}", to: "lessons#lesson#{i}"
end
  resources :lessons
  resources :account_activations, only: [:edit]
  resources :successes, only: %i[create destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
