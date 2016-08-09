Rails.application.routes.draw do
  resources :contact_messages, only: [:new, :create, :index, :show]
  resources :emails
  get "login", to: "emails#login"
  get "create_session", to: "emails#create_session"
end
