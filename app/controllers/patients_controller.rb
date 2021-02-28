class PatientsController < ApplicationController
include ApplicationHelper
before_action :redirect_if_not_logged_in

    def index
        if params[:optician_id] && @optician = Optician.find_by_id(params[:optician_id])
            @patients = @optician.patients
        else
            redirect_to root_path
        end
    end

    def show
        @patient = Patient.find_by(id: params[:id])
    end

    def new
        @patient = Patient.new
        @patient.build_optometrist
    end

    def create
        @patient = current_user.patients.build(patient_params)
        if @patient.save
            #@patient.optometrist << Optometrist.find(params[:optometrist_id]) 
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
            flash[:message] = "Patient successfully updated."
            redirect_to optician_patients_path(current_user.id)
        else
            render :new
        end
    end
    
    def destroy
        @patient = Patient.find(params[:id])
        @patient.destroy
        flash[:message] = "Patient successfully deleted."
        redirect_to optician_patients_path(current_user.id)
    end


    private

    def patient_params
        params.require(:patient).permit(:first_name, :last_name, :phone_number, :email, :address, :birthdate, :total_revenue, :notes, :optometrist_id, optometrist_attributes: [:last_name])
    end

end