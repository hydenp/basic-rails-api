Rails.application.routes.draw do
  resources :stores


  # route for product actions via api/v1/stores
  namespace :api do
    namespace :v1 do
      resources :stores do
        resources :products
      end
    end
  end

  # route for product actions via api/v1/products
  namespace :api do
    namespace :v1 do
      resources :products
    end
  end

  # route to add many stores for starter data 
  namespace :api do
    namespace :v1 do
      resources :stores do
        collection do
          post 'create_many'
        end
      end
    end
  end

  namespace :api do
    namespace :v1 do
      resources :products do
        collection do
          post 'create_many'
        end
      end
    end
  end

end
