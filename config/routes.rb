Rails.application.routes.draw do

 resources :candidates
  
  resources :joboffers
  devise_for :users

  root to: "joboffers#index"

  get :search, controller: "application"

  patch '/apply/:id', to: 'joboffers#apply', as: "apply"

end
