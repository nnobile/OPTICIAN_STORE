class Patient < ApplicationRecord
    belongs_to :optometrist
    belongs_to :optician
    validates :first_name, :last_name, presence: true
    validates_uniqueness_of :email, :phone_number

    scope :patients_optician, -> (opt_id){where('optician_id = ?', opt_id)}

        

end
