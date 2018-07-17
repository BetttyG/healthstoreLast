Rails.application.routes.draw do
  resources :orders do resources:orderitemsend
end

  devise_for :users do resources:orders end

  
  get '/checkout' =>'cart#createOrder'
  
  post '/search' =>'items#search'
  
    get '/payment' => 'orders#pay'
    get '/shipped/:id' => 'orders#shipped'
  get 'cart/index'
  
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
