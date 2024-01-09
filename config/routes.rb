Rails.application.routes.draw do
  resources :tasks
  resources :projects
  devise_for :users
  resources :users
  # get 'pages/home'
  post '/custom_users', to: 'users#create', as: 'custom_users'
  get 'about', to: 'pages#about'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  root "pages#home"
end
