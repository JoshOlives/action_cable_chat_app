Rails.application.routes.draw do
  root 'messages#index'
  resources :users
  resources :messages
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  
  mount ActionCable.server, at:'/cable'
  
  #apparently it works fine without this
  # Add Cloud9 origin for Action Cable requests.
  #config.action_cable.allowed_request_origins = [
  # 'https://82203d0cfccb4877866977ba97e7515b.vfs.cloud9.us-east-2.amazonaws.com/' ]
end
