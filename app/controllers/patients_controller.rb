class PatientsController < ApplicationController
include ApplicationHelper

    def index
        #if params[:optician_id] && optician = Optician.find_by_id(params[:optician_id])
        #if logged_in?
        @patients = Patient.order(:last_name)
    end

    def show
        @patient = Patient.find_by(id: params[:id])
    end

    def new
       @patient = Patient.new
    end

    def create
        @patient = Patient.new(patient_params)
        if @patient.save
            redirect_to opticians_path
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
            flash[:success] = "Patient successfully updated."
            redirect_to patients_path
        else
            render :new
        end
    end
    
    def destroy
        @patient.destroy
        flash[:success] = "Patient successfully deleted."
        redirect_to patients_path
    end

    private

    def patient_params
        params.require(:patient).permit(:first_name, :last_name, :phone_number, :email, :address, :birthdate, :total_revenue, :notes)
    end

end