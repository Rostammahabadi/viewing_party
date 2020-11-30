Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'
  get '/registration', to: 'registration#index'
  post '/registration', to: 'registration#create'
  get '/dashboard', to: 'dashboard#index'
  get '/discover', to: 'discover#index'
  post '/friends', to: 'friends#create'
  post '/login', to: 'session#create'
  delete '/logout', to: 'session#destroy'
end
