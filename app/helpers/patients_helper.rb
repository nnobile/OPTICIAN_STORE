module PatientsHelper

    def patient_full_name
        [@patient.first_name, @patient.last_name].join(' ')
    end

end
