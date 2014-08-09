SnailtrackerServer::Application.routes.draw do
  resources :logs

  resources :notes

  resources :actions

  resources :action_types

  resources :sessions

  resources :apps

  devise_for :users
end
