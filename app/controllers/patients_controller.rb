class PatientsController < ApplicationController
include ApplicationHelper

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
        #binding.pry
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
        @patient = Patient.find(params[:id])
        @patient.destroy
        flash[:success] = "Patient successfully deleted."
        redirect_to patients_path
    end

    private

    def patient_params
        params.require(:patient).permit(:first_name, :last_name, :phone_number, :email, :address, :birthdate, :total_revenue, :notes)
    end

end