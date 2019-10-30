class List < ApplicationRecord
    belongs_to :user 
    has_many :to_dos


    def serialize 
        {id: self.id, heading: self.heading, toDos: self.to_dos.map{ |td| td.serialize }}
    end 
end
