class UsersController < ApplicationController
   
    skip_before_action :authenticate, only: [:login, :create]


    def login 
        byebug
    end 


    def create
        new_user = User.new(first_name: create_user_params[:firstName], last_name: create_user_params[:lastName], username: create_user_params[:username], password: create_user_params[:password])
        if new_user.save
            byebug
            render json: { success: true, user: new_user.serialize, token: generate_token(new_user) }
        else
            render json: { success: false, errors: new_user.errors.full_messages}
        end
    end 

    private 

    def login_params 
        params.require(:user).permit(:username, :password)
    end 

    def create_user_params
        params.require(:user).permit(:firstName, :lastName, :username, :password)
    end
end
