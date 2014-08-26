SnailtrackerServer::Application.routes.draw do
  # API Resources
  namespace :api do
    resources :logs
    resources :notes
    resources :actions
    resources :action_types
    resources :sessions
    resources :errors
  end

  # Web Resources
  resources :apps
  resources :sessions

  unauthenticated :user do
    root to: 'welcome#index', as: 'root'
  end

  authenticated :user do
    root :to => "apps#index", as: 'authenticated_root'
  end

  devise_for :users
  devise_scope :user do
    post '/sessions/user', to: 'devise/sessions#create'
  end

end
