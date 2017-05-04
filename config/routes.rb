Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      namespace :merchants do
        get '/find_all', to: 'find#index'
        get '/find', to: 'find#show'
        get '/random', to: 'random#show'
        get '/most_revenue', to: 'revenue#index'
        get '/most_items', to: 'most_items#index'
        get '/revenue', to: 'revenue_date#index'
      end
      resources :merchants, only: [:index, :show] do
        scope module: :merchants do
          resources :items, only: [:index]
          resources :invoices, only: [:index]
          get '/revenue', to: 'revenue#show'
          get '/favorite_customer', to: 'customer#show'
        end
      end

      namespace :transactions do
        get '/find_all', to: 'find#index'
        get '/find', to: 'find#show'
        get '/random', to: 'random#show'
      end
      resources :transactions, only: [:index, :show] do
        scope module: :transactions do
          get '/invoice', to: 'invoice#show'
        end
      end

      namespace :customers do
        get '/find_all', to: 'find#index'
        get '/find', to: 'find#show'
        get '/random', to: 'random#show'
      end
      resources :customers, only: [:index, :show] do
        scope module: :customers do
          resources :invoices, only: [:index]
          resources :transactions, only: [:index]
        end
      end

      namespace :invoices do
        get 'find_all', to: 'find#index'
        get '/find', to: 'find#show'
        get '/random', to: 'random#show'
      end
      resources :invoices, only: [:index, :show] do
        scope module: :invoices do
          resources :transactions, only: [:index]
          resources :invoice_items, only: [:index]
          resources :items, only: [:index]
          get '/customer', to: 'customer#show'
          get '/merchant', to: 'merchant#show'
        end
      end

      namespace :items do
        get '/find_all', to: 'find#index'
        get '/find', to: 'find#show'
        get '/random', to: 'random#show'
      end
      resources :items, only: [:index, :show] do
        scope module: :items do
          resources :invoice_items, only: [:index]
          get '/merchant', to: 'merchant#show'
        end
      end

      namespace :invoice_items do
        get '/find_all', to: 'find#index'
        get '/find', to: 'find#show'
        get '/random', to: 'random#show'
      end
      resources :invoice_items, only: [:index, :show] do
        scope module: :invoice_items do
          get '/invoice', to: 'invoice#show'
          get '/item', to: 'item#show'
        end
      end
    end
  end
end
