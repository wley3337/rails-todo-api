class User < ApplicationRecord
    has_secure_password
    has_many :lists
    has_many :to_dos, through: :lists  
    validates :username, uniqueness: { case_sensitive: false }


    def serialize 
        {
            user: {firstName: self.first_name, lastName: self.last_name, username: self.username},
            lists: self.sort_and_serialize,
            # toDos: self.to_dos
        }   
    end

    def sorted_lists 
        self.lists.sort_by &:display_order
    end

    def sort_and_serialize 
        self.sorted_lists.map{ |list| list.serialize }
    end 

end
