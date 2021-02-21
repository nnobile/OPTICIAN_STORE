class PatientsController < ApplicationController
before_action :check_for_logged_in #, except: [:index]

    def index
        if params[:optician_id] && optician = Optician.find_by_id(params[:optician_id])
        @patients = Patient.order(:last_name)
    end

    def show
        set_patient
    end

    def new
        if params[:optician_id] && optician = Optician.find_by_id(params[:optician_id])
            @patient = optician.patients.build
        else
            @patient = Patient.new
            @patient.build_optician
        end
    end

    def create
        @patient = current_user.patients.build(patient_params)
        if @patient.save
        redirect_to patient_path(@patient)
        else
            @patient.build_optician unless @patient.optician
            render :new
        end
    end

    def edit
        set_patient 
    end

    def update
        set_patient
        if @patient.update(patient_params)
            redirect_to edit_patient_path(@patient)
        else
            render :edit
        end
    end

    def destroy
        set_patient
        @patient.destroy
        redirect_to patients_path
    end


private

    def set_patient
        @patient = Patient.find_by(id: params[:id])
        if !@patient
            redirect_to patients_path
        end
    end

    def patient_params
        params.require(:patient).permit(:first_name, :last_name, :phone_number, :email, :address, :birthdate, :total_revenue, :notes, :optician_id)
    end

end