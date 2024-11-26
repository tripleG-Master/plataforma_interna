Rails.application.routes.draw do
  devise_for :users, 
    skip: [:registrations],
    controllers: { 
      sessions: "users/sessions" 
    }
  
  namespace :admin do 
    resources :users
  end

  resources :joboffers do
    resources :applications, only: [:create]
  end
  
  get "applications/create"
  

  # Defines the root path route ("/")
  root "joboffers#index"
  
end
