SnailtrackerServer::Application.routes.draw do
  # API Resources
  namespace :api do
    resources :logs
    resources :notes
    resources :actions
    resources :action_types
    resources :sessions
  end

  # Web Resources
  resources :apps

  root to: 'welcome#index'

  devise_for :users
  devise_scope :user do
    post '/sessions/user', to: 'devise/sessions#create'
  end

end
