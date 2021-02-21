class OpticiansController < ApplicationController

    # Loading the signup form
    def new
        @optician = Optician.new
    end

    # Handling signup
    def create
        @optician = Optician.new(optician_params)
        if @optician.save
            session[:optician_id] = @optician.id
            redirect_to new_patient_path
        else
            render :new
        end
    end

    def destroy
        if logged_in?
            current_user.destroy
        else
            redirect_to signup_path
        end
    end
    
    private

    def optician_params
        params.require(:optician).permit(:username, :email, :password, :first_name, :last_name, :certificate_number)
    end




end
