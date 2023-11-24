Rails.application.routes.draw do
  devise_for :users, path: '', path_names:{
    sign_in: 'login',
    sign_out: 'logout',
    registration: 'signup'
  },
  controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  resources :carts, only: [:create, :show] do
    member do
      post 'add_products_to_cart'
      post 'remove_products_from_cart'
    end
  end

  resources :products, except: [:new, :edit]
end
