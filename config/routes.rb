SnailtrackerServer::Application.routes.draw do
  # API Resources
  resources :logs
  resources :notes
  resources :actions
  resources :action_types
  resources :sessions

  # Web Resources
  resources :apps

  devise_for :users

  root to: "welcome#index"
end
