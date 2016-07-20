Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :products
  
  resource :cart, only: [:show] do
  	post "add/:id", :as => "add", :action => "add"
  	get :checkout
  end

  resources :orders, only: [ :index, :show, :create, :update ]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'products#index'
end
