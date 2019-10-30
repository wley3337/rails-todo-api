class ListsController < ApplicationController

    def create 
        list = List.new(heading: list_params[:heading], user: @current_user, display_order: 0)
        if list.save
            render json: { success: true, list: list.serialize}
        else 
            render json: { success: false, errors: { messages: list.errors.full_messages} }
        end
    end 

    private 

    def list_params
        params.require(:list).permit(:heading)
    end
end
