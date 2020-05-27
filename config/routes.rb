Rails.application.routes.draw do
  scope ENV['RELATIVE_URL_ROOT'] || '' do
    scope 'one' do
      get 'welcome/index'

      # Handles launches.
      get 'launch', :to => 'articles#launch', as: :launch

      resources :articles

      root 'welcome#index'
    end
  end
end
