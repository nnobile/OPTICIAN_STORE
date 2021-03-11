class PatientsController < ApplicationController
include ApplicationHelper
before_action :redirect_if_not_logged_in

    def index
        if params[:optometrist_id] && @optometrist = Optometrist.find_by_id(params[:optometrist_id])
            @patients = @optometrist.patients
        else
            flash[:message] = "You are not authorized to view this page."
            redirect_to root_path
        end
    end

    def show
        if params[:optometrist_id] && @optometrist = Optometrist.find_by_id(params[:optician_id])
            @patient = Patient.find_by(id: params[:id])
        else
            flash[:message] = "Please go through optometrist directory to view patient details."
            redirect_to root_path
        end
    end

    def new
        @patient = Patient.new
        @patient.build_optometrist
    end

    def create
        @patient = current_user.patients.build(patient_params)
        if @patient.save
            redirect_to optician_patients_path(current_user.id)
        else
            render :new
        end
    end

    def edit
        @patient = Patient.find(params[:id])
    end

    def update
        if logged_in?
            @patient = Patient.find(params[:id])
            @patient.update(patient_params)
            redirect_to optician_patients_path(current_user.id)
        else
            render :new
        end
    end
    
    def destroy
        @patient = Patient.find(params[:id])
        @patient.destroy
        redirect_to optician_patients_path(current_user.id)
    end

    def abc
        @patients = Patient.order_alphabetically
    end



    private

    def patient_params
        params.require(:patient).permit(:first_name, :last_name, :phone_number, :email, :address, :birthdate, :total_revenue, :notes, :optometrist_id, optometrist_attributes: [:last_name])
    end

end