Rails.application.routes.draw do

 resources :candidates
  
  resources :joboffers
  devise_for :users

  root to: "joboffers#index"

  get :search, controller: "application"

end
