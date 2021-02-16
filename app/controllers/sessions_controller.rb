class SessionsController < ApplicationController
    
    def new
        @optician = Optician.new
        render :login
    end

    def create
    end

    def home
    end

    #Logout
    def destroy
        session.clear
        redirect_to '/'
    end

end
