class OpticiansController < ApplicationController

    # Loading the signup form
    def new
        @optician = Optician.new
    end

    def index
        @opticians = Optician.all
    end

    # Handling signup
    def create
        @optician = Optician.new(optician_params)
        if @optician.save
            #login the user
            session[:optician_id] = @optician.id
            redirect_to patient_path
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
