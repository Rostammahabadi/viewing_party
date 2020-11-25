Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'
  get '/registration', to: 'registration#index'
  post '/registration', to: 'registration#create'
  get '/dashboard', to: 'dashboard#index'
end
