class Optician < ApplicationRecord
    has_secure_password
    has_many :patients
    has_many :optometrists, through: :patients
    validates :username, :email, :certificate_number, presence: true
    validates :username, :email, :certificate_number, uniqueness: true 
    validates :certificate_number, uniqueness: true, length: { is: 6 }, presence: true

end
