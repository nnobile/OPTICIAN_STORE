class SessionsController < ApplicationController
    
    def new
        @optician = Optician.new
        render :login
    end

    def create
        @optician = Optician.find_by(username: params[:optician][:username])
        if @optician && @optician.authenticate(params[:optician][:password])
            session.clear
            session[:optician_id] = @optician.id
            flash[:alert] = "Welcome, #{@optician.first_name}."
            redirect_to optician_patients_path(@optician.id)
        else
            flash[:error] = "Sorry, please check your credentials and try again."
            redirect_to '/login'
        end
    end

    def omniauth
        #check step 8 in google oauth2 for rails guide
        optician = Optician.from_omniauth(request.env['omniauth.auth'])
        if optician.valid?
            session.clear
            session[:optician_id] = optician.id
            redirect_to patients_path
        else
            redirect_to signup_path
        end
    end

    def home
    end

    #Logout
    def destroy
        session.clear
        flash[:success] = "You have logged out."
        redirect_to '/'
    end

    private
    
    def auth
      request.env['omniauth.auth']
    end

end
