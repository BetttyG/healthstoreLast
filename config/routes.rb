Rails.application.routes.draw do
  resources :categories
  #get 'users/show'
  
  resources :orders do resources :orderitemsend
end

  devise_for :users do resources :orders end
  resources :users

  get '/checkout' =>'cart#createOrder'
  
  post '/search' =>'items#search'
  
  get '/payment' => 'orders#pay'
    get '/shipped/:id' => 'orders#shipped'
  get 'cart/index'
  
  get 'category/:title' => 'static_pages#category'
  
  resources :items
  root 'static_pages#home'
  # get '/home' => 'static_pages#home'
  get '/help' => 'static_pages#help'
  get '/about' => 'static_pages#about'
  
  get '/login' => 'user#login'
  get '/logout' => 'user#logout'
  
  get '/cart/clear', to: 'cart#clearCart'
  get '/cart' => 'cart#index'
  get '/cart/:id' => 'cart#add'
  get '/cart/remove/:id' => 'cart#remove'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
