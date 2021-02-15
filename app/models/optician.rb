class Optician < ApplicationRecord
    has_secure_password
    has_many :patients
    
end
