module PatientsHelper

    def optician_id
        @optician_id = Patient.find_by(optician_id)
    end


end
