Rails.application.routes.draw do
  devise_for :contacts, controllers: {
    sessions: "contacts/sessions",
    registrations: "contacts/registrations"
  }
  resources :dashboard
  resources :business do
    resources :products
  end
  root 'dashboard#index'
end
