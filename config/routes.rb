Rails.application.routes.draw do
  resources :ssl, only: :create
  resources :identities, only: %i(index create), defaults: { format: :json }
end
