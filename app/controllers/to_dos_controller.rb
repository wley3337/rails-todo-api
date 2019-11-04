class ToDosController < ApplicationController

    def create 
        new_to_do = ToDo.new(
            title: create_params[:title],
            list_id: create_params[:listId], 
            description: create_params[:description], 
            due: (create_params[:due]).to_datetime
            )
        if new_to_do.save 
            render json: { success: true , toDo: new_to_do.serialize }
        else 
            render json: { success: false, messages: new_to_do.erorrs.full_messages }
        end
    end 

    def destroy 
        to_do_to_destroy = ToDo.find(delete_params[:id])
        if to_do_to_destroy 
            list_id = to_do_to_destroy.list_id
            to_do_to_destroy.destroy
            render json:{ success: true, toDoId: delete_params[:id], toDoListId: list_id}
        else
            render json: { success: false, messages: ["ToDo was not deleted"]}
        end 
    end 

    private 

    def create_params 
        # description and due are optional on front
        params.require(:to_do).permit(:listId, :title, :description, :due)
    end
    
    def delete_params
        params.require(:to_do).permit(:listId, :title, :description, :due, :id)
    end
end
