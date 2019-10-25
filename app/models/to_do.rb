class ToDo < ApplicationRecord
    belongs_to :list

    def serialize 
        {listId: self.list.id, title: self.title, description: self.description, due: self.due}
    end 
end
