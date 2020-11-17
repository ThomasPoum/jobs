Rails.application.routes.draw do

  resources :joboffers
  devise_for :users

  root to: "joboffers#index"

end
