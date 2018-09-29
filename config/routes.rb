Rails.application.routes.draw do
  resources :shorteners, except: [:edit, :update]
  
  root "shorteners#index"
end
