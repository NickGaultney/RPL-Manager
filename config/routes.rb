Rails.application.routes.draw do
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#logout'

  resources :users, only: [:new, :create]
  get 'api_key', to: 'users#api_key'
  post 'api_key', to: 'users#update'
  get 'new_key', to: 'users#new_key'

  resources :printers
  resources :print_logs

  namespace :api do
    namespace :v1 do
      get '/printers_api', to: 'printers_api#index'
      post '/printers_api', to: 'printers_api#create'

      get '/printers_api/show', to: 'printers_api#show'
      post '/printers_api/edit', to: 'printers_api#update'
      delete '/printers_api/delete', to: 'printers_api#destroy'

      get '/print_logs_api', to: 'print_logs_api#index'
      post '/print_logs_api', to: 'print_logs_api#create'

      post '/print_logs_api/edit', to: 'print_logs_api#update'
    end
  end

  root to: "printers#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
