Rails.application.routes.draw do
  scope ENV['RELATIVE_URL_ROOT'] || '' do
    scope 'one' do
      get 'welcome/index'

      # Handles launches.
      get 'launch', :to => 'sessions#new', as: :launch

      # Handles Omniauth authentication.
      get '/auth/:provider', to: 'sessions#new', as: :omniauth_authorize
      get '/auth/:provider/callback', to: 'sessions#create', as: :omniauth_callback
      get '/auth/failure', to: 'sessions#failure', as: :omniauth_failure

      resources :articles

      root 'welcome#index'
    end
  end
end
