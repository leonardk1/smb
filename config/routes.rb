Rails.application.routes.draw do
  devise_for :contacts, controllers: {
    sessions: "contacts/sessions",
    registrations: "contacts/registrations"
  }
  resources :dashboard
  resources :business
  root 'dashboard#index'
end
