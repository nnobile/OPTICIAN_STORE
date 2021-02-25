class OptometristsController < ApplicationController
include ApplicationHelper

    def index
        if params[:optician_id] && @optician = Optician.find_by_id(params[:optician_id])
            @optometrists = @optician.optometrists
        else
            redirect_to optometrists_path
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
            redirect_to optometrists_path
        else
            render :new
        end
    end

    def destroy
        # upon deletion, reassign all linked patients to dummy optometrist
        # opticians that are not linked to optometrist can delete optometrist?
        if logged_in?
            @current_optometrist = Optometrist.find_by(id: params[:id])
            @current_optometrist.destroy
            redirect_to optometrists_path
        else
            redirect_to signup_path
        end
    end

    end
    
    
    private 

    def optometrist_params
        params.require(:optometrist).permit(:first_name, :last_name, :optometrist_email, :phone_number, :address, :notes)
    end
