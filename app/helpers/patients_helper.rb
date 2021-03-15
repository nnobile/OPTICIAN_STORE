module PatientsHelper

    def display_optometrist(optometrist, f)
        if optometrist
            f.hidden_field :optometrist_id
        else
            render partial: 'optometrist_select', locals: {f: f}
        end
    end

end
