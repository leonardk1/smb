Rails.application.routes.draw do
  devise_for :contacts, controllers: {
    sessions: "contacts/sessions",
    registrations: "contacts/registrations"
  }
  resources :dashboard
  root 'dashboard#index'
end
