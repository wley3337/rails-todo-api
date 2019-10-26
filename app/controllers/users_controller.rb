class UsersController < ApplicationController
   
    skip_before_action :authenticate, only: [:login, :create]

    def create
        new_user = User.new(first_name: create_user_params[:firstName], last_name: create_user_params[:lastName], username: create_user_params[:username], password: create_user_params[:password])
        if new_user.save
            render json: { success: true, user: new_user.serialize, token: generate_token(new_user) }
        else
            render json: { success: false, errors: new_user.errors.full_messages}
        end
    end 

    def login 
        user = User.find_by(username: login_params[:username])
        if user && user.authenticate(login_params[:password])
            render json: { success: true, user: user.serialize, token: generate_token(user) }
        else
            render json: { success: false, errors: ["Wrong Username or Password"]}
        end
    end 

    def show 
        render json: { success: true, user: @current_user.serialize }
    end 

    private 

    def login_params 
        params.require(:user).permit(:username, :password)
    end 

    def create_user_params
        params.require(:user).permit(:firstName, :lastName, :username, :password)
    end
end
