class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
    def user_params
      params.require(:user).permit(:name, :first_name, :last_name, :email, :password, :password_confirmation, :remember_me, :is_female, :date_of_birth)
    end

       has_many :orders
       

end
