Rails.application.routes.draw do
  root 'users#index'
  get 'uis/material_icons'
  get 'uis/modals'
  get 'uis/notification'
  get 'uis/range_slider'
  get 'uis/sweetalert'
  get 'uis/themify_icons'
  get 'uis/widgets'
  get 'uis/treeview'
  get 'uis/font_awesome_icons'
  get 'uis/dripicons'
  get 'uis/draggable_cards'
  get 'uis/components'
  get 'uis/checkbox_radio'
  get 'uis/cards'
  get 'uis/buttons'
  get 'tables/basic'
  get 'tables/datatable'
  get 'tables/editable'
  get 'tables/responsive'
  get 'tables/tablesaw'

  get  '/signup',  to: 'users#new'
  resources :users




  get 'pages/confirm_mail'
  get 'pages/lock_screen'
  get 'login', to: 'pages#login'
  get 'register', to: 'pages#register'
  # resources :password_resets,     only: [:new, :create, :edit, :update]
  get 'pages/recoverpw'
  get 'pages/starter', to: 'pages#starter'
  get 'calendar/:id', to: 'pages#calendar'
  get 'pages/inbox'
  get 'forms/xeditable'
  get 'forms/wysiwig'
  get 'forms/wizard'
  get 'forms/validation'
  get 'forms/fileupload'
  get 'forms/elements'
  get 'forms/advanced'
  get 'extras/maps'
  get 'extras/maintenance'
  get 'extras/invoice'
  get 'extras/gallery'
  get 'extras/faq'
  get 'extras/comingsoon'
  get 'extras/email'
  get 'extras/contact'
  get 'extras/tour'
  get 'extras/timeline'
  get 'extras/taskdetail'
  get 'extras/taskboard'
  get 'extras/projects'
  get 'extras/profile'
  get 'extras/pricing'
  get 'chartist/:id', to: 'charts#chartist'
  get 'chartjs/:id', to: 'charts#chartjs'
  get 'flot/:id', to: 'charts#flot'
  get 'morris/:id', to: 'charts#morris'
  get 'other/:id', to: 'charts#other'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
