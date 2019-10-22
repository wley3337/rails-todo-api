class UsersController < ApplicationController
    # user.lists.sort_by &:display_order
    skip_before_action :authenticate, only: [:login, :create]


    def login 
        byebug
    end 


    def create
        byebug
    end 

    private 

    def login_params 
        params.require(:user).permit(:username, :password)
    end 
end
