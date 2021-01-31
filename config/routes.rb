Rails.application.routes.draw do
  resources :ssl, only: :create
  resources :identities, only: %i(index create), defaults: { format: :json }
  post "/new-update", to: "updates#trigger"

  get "/admin", to: "admin#login"
  post "/admin", to: "admin#login_post"

  constraints Basic do
    mount Sidekiq::Web => '/sidekiq'
    mount RailsAdmin::Engine => '/super-admin', as: 'rails_admin'
  end
end
