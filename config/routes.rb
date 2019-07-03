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
  resources :users, except: [:index]

  get '/lessons/:id', to: 'lessons#index'
  get '/lessons/:id/1', to: 'lessons#lesson1'
  get '/lessons/:id/2', to: 'lessons#lesson2'
  get '/lessons/:id/3', to: 'lessons#lesson3'
  get '/lessons/:id/4', to: 'lessons#lesson4'
  get '/lessons/:id/5', to: 'lessons#lesson5'
  get '/lessons/:id/6', to: 'lessons#lesson6'
  get '/lessons/:id/7', to: 'lessons#lesson7'
  resources :lessons
  resources :account_activations, only: [:edit]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
