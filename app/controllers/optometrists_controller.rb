class OptometristsController < ApplicationController
include ApplicationHelper

    def index
        if logged_in? 
            @optometrists = Optometrist.all
        else
           redirect_to root_path
        end
    end

    def show
        @optometrist = Optometrist.find_by(id: params[:id])
    end

    def new
        @optometrist = Optometrist.new
    end

    def create
        @optometrist = Optometrist.new(optometrist_params)
        if @optometrist.save
            redirect_to optometrist_path(@optometrist.id)
        else
            render :new
        end
    end
    

    private 

    def optometrist_params
        params.require(:optometrist).permit(:first_name, :last_name, :optometrist_email, :phone_number, :address, :notes, patient_ids:[])
    end

end