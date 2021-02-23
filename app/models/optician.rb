class Optician < ApplicationRecord
    has_secure_password
    has_many :patients
    has_many :optometrists, through: :patients
    validates :username, :email, :certificate_number, :phone_number, presence: true
    validates :username, :email, :certificate_number, :phone_number, uniqueness: true 
    validates :certificate_number, uniqueness: true, length: { is: 6 }, presence: true

    def self.get_id
        @optician = Optician.id
    end

    def self.from_omniauth(response)
        Optician.find_or_create_by(uid: response[:uid], provider: response[:provider]) do |u|
            u.username = response[:info][:name]
            u.email = response[:info][:email]
            u.password = SecureRandom.hex(15)
        end
    end


end
