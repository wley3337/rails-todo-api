class ListsController < ApplicationController

    def create 
        list = List.new(heading: list_params[:heading], user: @current_user, display_order: 0)
        if list.save
            render json: { success: true, list: list.serialize}
        else 
            render json: { success: false, errors: { messages: list.errors.full_messages} }
        end
    end 

    def destroy 
        list_to_delete = List.find(delete_list_params[:id])
        return_list = list_to_delete.serialize
        if list_to_delete.destroy
            render json: { success: true, list: return_list }
        else 
            render json: { success: false, errors: { messages: list_to_delete.errors} }
        end
    end 

    private 

    def list_params
        params.require(:list).permit(:heading)
    end

    def delete_list_params
        params.require(:list).permit(:id)
    end 
end
