Rails.application.routes.draw do
  get 'sessions/new'

  get 'sessions/create'

  get 'sessions/login'

  get 'users/new'

  get 'users/create'

  resources :printers
  resources :print_logs
  
=begin
  namespace :api do
  	namespace :v1 do
  		resources :printers_api, param: :name
  		resources :print_logs_api, param: :name
  	end
  end
=end
  get '/printers', to: 'printer#index'

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
