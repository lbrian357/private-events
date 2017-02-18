Rails.application.routes.draw do
  root 'static_pages#home'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  resources :users, only: [:new, :create, :show]
  resources :events, only: [:index, :new, :create, :show]
  resources :attendanceships, only: [:create]



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
