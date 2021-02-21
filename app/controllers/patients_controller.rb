class PatientsController < ApplicationController

    def index
        #if params[:optician_id] && optician = Optician.find_by_id(params[:optician_id])
        @patients = Patient.order(:last_name)
    end

    def show
        @patient = Patient.find(params[:id])
    end

    def new
        if params[:optician_id] && optician = Optician.find_by_id(params[:optician_id])
            @patient = optician.patients.build
        else
            @patient = Patient.new
        end
    end

    def create
        if logged_in?
            @patient = Patient.create(patient_params)
            flash[:success] = "New patient successfully added."
            redirect_to patients_path
        else
            render :new
        end
    end

    def edit
        @patient = Patient.find(params[:id])
    end

    def update
        if @patient.update(patient_params)
            flash[:success] = "This patient was successfully updated."
            redirect_to patients_path
        else
            render :edit
        end
    end

    def destroy
        @patient.destroy
        flash[:success] = "Patient successfully deleted."
        redirect_to patients_path
    end

    private

    def patient_params
        params.require(:patient).permit(:first_name, :last_name, :phone_number, :email, :address, :birthdate, :total_revenue, :notes, :optician_id)
    end

end