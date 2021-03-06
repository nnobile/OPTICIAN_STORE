class Optometrist < ApplicationRecord
    has_many :patients
    has_many :opticians, through: :patients
    validates :first_name, :last_name, :address, :phone_number, presence: true
    validates :optometrist_email, presence: true, uniqueness: true

    def full_name
        full_name = [last_name, first_name].map(&:capitalize).join(", ")
    end
    
end
