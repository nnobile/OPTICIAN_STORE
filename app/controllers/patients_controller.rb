class PatientsController < ApplicationController
include ApplicationHelper

    def index
        @patients = Patient.order(:last_name)
    end

    def show
        @patient = Patient.find_by(id: params[:id])
    end

    def new
        @patient = Patient.new
    end

    def create
        if logged_in?
            @patient = Patient.new(optician_id: params[:optician_id])
            @patient.save
            redirect_to optician_patients_path
        else
            render :new
        end
    end

    def edit
        @patient = Patient.find_by(id: params[:id]) 
    end

    def update
        if @patient.update(patient_params)
            redirect_to edit_patient_path(@patient)
        else
            render :edit
        end
    end

    def destroy
        @patient.destroy
        redirect_to patient_path
    end


private

    # def set_patient
    #     @patient = Patient.find_by(id: params[:id])
    #     if !@patient
    #     redirect_to optometrist_path
    #     end
    # end

    def patient_params
        params.require(:patient).permit(:first_name, :last_name, :phone_number, :email, :address, :birthdate, :total_revenue, :notes)
    end

end