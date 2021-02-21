class OptometristsController < ApplicationController
include ApplicationHelper

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
            redirect_to patient_path(@patient)
        else
            redirect_to signup_path
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
