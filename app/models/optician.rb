class Optician < ApplicationRecord
    has_secure_password
    has_many :patients
    has_many :optometrists, through: :patients
    validates :username, :email, presence: true
    validates :username, :email, uniqueness: true
    validates :certificate_number, length: { in: 5..6 }, allow_nil: true, uniqueness: true

    def self.from_omniauth(response)
        Optician.find_or_create_by(uid: response[:uid], provider: response[:provider]) do |u|
            u.username = response[:info][:name]
            u.email = response[:info][:email]
            u.password = SecureRandom.hex(15)
        end
    end

    def optometrist_attributes=(optometrist_attributes)
        optometrist_attributes.values.each do |optometrist_attribute|
          optometrist = Optometrist.find_or_create_by(optometrist_attribute)
          self.optometrists << optometrist
        end
    end

end
