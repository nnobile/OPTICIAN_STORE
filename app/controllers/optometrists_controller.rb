class OptometristsController < ApplicationController

    def index
        @optometrists = Optometrist.all
    end

    def show
        @optometrist = Optometrist.find_by(id: params[:id])
    end

    def create
        if logged_in?
            @optometrist = Optometrist.create(optometrist_params)
            @optometrist.save
        else
            redirect_to login_path
        end
    end


    end
    
    
    private 

    def optometrist_params
        params.require(:optometrist).permit(:first_name, :last_name, :optometrist_email, :phone_number, :address, :notes)
    end







end
