class PatientsController < ApplicationController
include ApplicationHelper
before_action :redirect_if_not_logged_in

    def index
        if params[:optician_id] && @optician = Optician.find_by_id(params[:optician_id]) 
            if @optician.id == current_user.id
                @patients = @optician.patients
            else
                flash[:message] = "You are not authorized to view another optician's patient list."
                redirect_to root_path  
            end
        else
            flash[:message] = "You are not authorized to view this page."
            redirect_to root_path
        end
    end

    def show
        if params[:optician_id] && @optician = Optician.find_by_id(params[:optician_id])
            @patient = Patient.find_by(id: params[:id])
            if current_user.id == @patient.optician_id
                @patient
            else
                flash[:message] = "You are not authorized to view another optician's patient list."
                redirect_to root_path 
            end
        else
            flash[:message] = "Please go through patient directory to view patient details."
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


    private

    def patient_params
        params.require(:patient).permit(:first_name, :last_name, :phone_number, :email, :address, :birthdate, :total_revenue, :notes, :optometrist_id, optometrist_attributes: [:last_name])
    end

end