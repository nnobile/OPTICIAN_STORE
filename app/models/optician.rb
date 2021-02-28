class Optician < ApplicationRecord
    has_secure_password
    has_many :patients
    has_many :optometrists, through: :patients
    validates :username, :email, presence: true #remove this one
    #accepts_nested_attributes_for :optometrists
    validates :username, :email, uniqueness: true  #:certificate_number, :phone_number, #remove this one
    #validates :certificate_number, uniqueness: true, length: { is: 6 }

    def self.get_id
        @optician = @optician.id
    end

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

    # def full_name
    #     full_name = [last_name, first_name].map(&:capitalize).join(", ")
    # end

end
