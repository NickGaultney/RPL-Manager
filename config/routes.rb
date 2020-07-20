Rails.application.routes.draw do
  resources :printers
  resources :print_logs

  namespace :api do
  	namespace :v1 do
  		resources :printers_api, param: :name
  		resources :print_logs_api, param: :name
  	end
  end

  root to: "printers#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
