Rails.application.routes.draw do
  resources :contact_messages, only: [:new, :create, :index, :show]
  resources :emails
  get "new_reply", to: "emails#new_reply"
  post "create_reply", to: "emails#create_reply"
end
