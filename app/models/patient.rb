class Patient < ApplicationRecord
    belongs_to :optometrist
    belongs_to :optician
    validates :first_name, :last_name, presence: true
    validates_uniqueness_of :email, :phone_number


    # def patient_and_total_revenue
    #     "#{self.first_name}, #{self.last_name} -- Total Revenue = #{self.total_revenue}"
    # end

    # def display_total_revenue 
    # end

        

end
