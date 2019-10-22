class User < ApplicationRecord
    has_secure_password
    has_many :lists
    has_many :to_dos, through: :lists  
    validates :username, uniqueness: { case_sensitive: false }

end
