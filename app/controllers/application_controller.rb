class ApplicationController < ActionController::Base
   protect_from_forgery with: :exception    
      before_action :configure_permitted_parameters, if: :devise_controller?
   

    protected

        #def configure_permitted_parameters
        #    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:name, :first_name, :last_name, :email, :password, :password_confirmation, :remember_me, :is_female, :date_of_birth) }
        #    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:email, :password, :remember_me) }
        #    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:name, :first_name, :last_name, :email, :password, :password_confirmation, :remember_me, :is_female, :date_of_birth) }
        #end
        
        def configure_permitted_parameters
            devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :first_name, :last_name, :email, :password, :password_confirmation, :remember_me, :is_female, :date_of_birth])
            devise_parameter_sanitizer.permit(:sign_in, keys: [:email, :password, :remember_me])
            devise_parameter_sanitizer.permit(:account_update, keys: [:name, :first_name, :last_name, :email, :password, :password_confirmation, :current_password, :remember_me, :is_female, :date_of_birth])
        end
        

#######
  # def current_cart
  #   Cart.find(session[:cart_id])
  #   rescue ActiveRecord::RecordNotFound
  #     cart = Cart.create
  #     session[:cart_id] = cart.id
  #     cart
  # end
  # helper_method :current_cart


end
