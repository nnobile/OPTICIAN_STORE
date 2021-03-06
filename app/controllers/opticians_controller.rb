class OpticiansController < ApplicationController

    def new
        @optician = Optician.new
    end

    def create
        @optician = Optician.new(optician_params)
        if @optician.save
            session[:optician_id] = @optician.id
            redirect_to optometrists_path(current_user.id)
        else
            render :new
        end
    end
    
    private

    def optician_params
        params.require(:optician).permit(:username, :email, :password, :first_name, :last_name, :phone_number, :certificate_number, optometrist_ids:[], optometrist_attributes: [:last_name])
    end




end
