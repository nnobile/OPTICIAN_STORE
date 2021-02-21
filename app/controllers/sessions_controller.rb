class SessionsController < ApplicationController
    
    def new
        @optician = Optician.new
        render :login
    end

    def create
        @optician = Optician.find_by(username: params[:optician][:username])
        if @optician && @optician.authenticate(params[:optician][:password])
            session[:optician_id] = @optician.id
            flash[:success] = "Welcome back, #{@optician.first_name}."
            redirect_to optician_path(@optician)
        else
            flash[:error] = "Sorry, please check your credentials and try again."
            redirect_to '/login'
        end
    end

    def omniauth
        #check step 8 in google oauth2 for rails guide
        optician = Optician.from_omniauth(request.env['omniauth.auth'])
        if optician.valid?
            session[:optician_id] = optician.id
            redirect_to optician_path(optician)
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
