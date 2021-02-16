class SessionsController < ApplicationController
    
    def new
        @optician = Optician.new
        render :login
    end

    def create
        @optician = Optician.find_by(username: params[:optician][:username])
        if @optician && @optician.authenticate(params[:optician][:password])
            session[:optician_id] = @optician.id
            redirect_to patients_path
        else
            redirect_to 'login'
        end
    end


    def home
    end

    #Logout
    def destroy
        session.clear
        redirect_to '/'
    end

end
