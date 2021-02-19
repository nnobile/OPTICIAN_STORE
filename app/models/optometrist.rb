class Optometrist < ApplicationRecord
    has_many :patients
    has_many :opticians, through: :patients

    def name_and_phone_number    
    end



end
