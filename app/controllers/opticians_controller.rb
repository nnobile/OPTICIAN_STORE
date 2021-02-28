class OpticiansController < ApplicationController

    def new
        @optician = Optician.new
    end

    def create
        @optician = Optician.new(optician_params)
        if @optician.save
            flash[:message] = "Welcome #{@optician.first_name} to your ClearView account."
            session[:optician_id] = @optician.id
            redirect_to optician_patients_path(current_user.id)
        else
            flash[:message] = @optician.errors.full_messages.join("")
            render :new
        end
    end
    
    private

    def optician_params
        params.require(:optician).permit(:username, :email, :password, :first_name, :last_name, :phone_number, :certificate_number, optometrist_ids:[], optometrist_attributes: [:last_name])
    end




end
