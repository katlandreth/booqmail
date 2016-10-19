Rails.application.routes.draw do
  resources :contact_messages, only: [:new, :create, :index]
  resources :emails
  get "new_reply", to: "emails#new_reply"
  get "how_to_ask", to: "contact_messages#how_to_ask", as: "how-to-ask"
  post "create_reply", to: "emails#create_reply"

  get "contact_messages/update_os_versions", as: 'update_os_versions'
end
