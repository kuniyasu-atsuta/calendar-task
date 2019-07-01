Rails.application.routes.draw do
  get 'password_resets/new'
  get 'password_resets/edit'
  root 'pages#landing'
  # get 'home', to: 'users#index'

  get '/help/:id', to: 'pages#help'
  get '/signup',  to: 'users#new'
  get '/login',   to: 'sessions#new'
  post '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  resources :users
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]

  # get 'users/index/:id', to: 'users#index'
  get 'users/ranking/:id', to: 'users#ranking'

  get 'piano/:id', to: 'pages#piano'
  get 'piano/:id/1', to: 'lessons#lesson1'
  get 'piano/:id/2', to: 'lessons#lesson2'
  get 'piano/:id/3', to: 'lessons#lesson3'
  get 'piano/:id/4', to: 'lessons#lesson4'
  get 'piano/:id/5', to: 'lessons#lesson5'
  get 'piano/:id/6', to: 'lessons#lesson6'
  get 'piano/:id/7', to: 'lessons#lesson7'

  get 'pages/confirm_mail'
  get 'pages/lock_screen'
  get 'login', to: 'pages#login'
  get 'register', to: 'pages#register'
  # resources :password_resets,     only: [:new, :create, :edit, :update]
  get 'pages/recoverpw'
  get 'pages/starter', to: 'pages#starter'
  get 'calendar/:id', to: 'pages#calendar'
  get 'profile/:id', to: 'extras#profile'
  get 'setting/:id', to: 'users#setting'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
