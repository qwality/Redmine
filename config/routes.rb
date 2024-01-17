Rails.application.routes.draw do
  resources :tasks
  resources :projects
  devise_for :users, path: 'auth'
  resources :users
  resources :tasks do
    member do
      get :show_in_table
      get :edit_in_table
      get :new_in_table
      put :show_in_table_update
    end
  end
  resources :projects do
    member do
      get :show_in_table
      get :edit_in_table
      get :new_in_table
      put :show_in_table_update
    end
  end
  resources :users do
    member do
      get :show_in_table
      get :edit_in_table
      get :new_in_table
      put :show_in_table_update
    end

    # collection do
    #   get 'page/:page', action: :index
    # end
  end
  resources :files do
    get 'create_in_card', on: :collection
    # get 'test_endpoint', on: :collection
  end
  # get 'pages/home'
  # post '/custom_users', to: 'users#create', as: 'custom_users'
  get 'about', to: 'pages#about'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  root "pages#home"
end
