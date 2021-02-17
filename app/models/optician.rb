class Optician < ApplicationRecord
    has_secure_password
    has_many :patients
    has_many :optometrists, through: :patients
    validates :username, :email, :certificate_number, presence: true
    validates :username, :email, :certificate_number, uniqueness: true
end
