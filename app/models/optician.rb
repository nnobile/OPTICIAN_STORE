class Optician < ApplicationRecord
    has_secure_password
    has_many :patients
    validates :username, :email, presence: true
    validates :username, :email, uniqueness: true
end
