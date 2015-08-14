Rails.application.routes.draw do
  devise_for :contacts  
  resources :dashboard
  root 'dashboard#index'
end
