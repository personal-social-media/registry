Rails.application.routes.draw do
  resources :ssl, only: :create
  resources :identities, only: %i(index create), defaults: { format: :json }
  post "/new-update", to: "updates#trigger"

  get "/admin", to: "admin#login"

  constraints Basic do
    mount Sidekiq::Web => '/sidekiq'
  end
end
