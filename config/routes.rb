Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      namespace :merchants do
        get '/find_all', to: 'find#index'
        get '/find', to: 'find#show'
        get '/random', to: 'random#show'
      end
      resources :merchants, only: [:index, :show]

      namespace :transactions do
        get '/find_all', to: 'find#index'
        get '/find', to: 'find#show'
        get '/random', to: 'random#show'
      end
      resources :transactions, only: [:index, :show]

      namespace :customers do
        get '/find_all', to: 'find#index'
        get '/find', to: 'find#show'
        get '/random', to: 'random#show'
      end
      resources :customers, only: [:index, :show]
      
      resources :invoices, only: [:index, :show]
      resources :items, only: [:index, :show]
      resources :invoice_items, only: [:index, :show]
    end
  end
end
