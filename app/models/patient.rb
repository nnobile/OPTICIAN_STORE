class Patient < ApplicationRecord
    belongs_to :optometrist
    belongs_to :optician


    def patient_and_total_revenue
        "#{self.first_name}, #{self.last_name} -- Total Revenue = #{self.total_revenue}"
    end

        

end
