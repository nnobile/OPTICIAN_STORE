class PatientsController < ApplicationController

    def index
        if params[:optician_id] && optician = Optician.find_by_id(params[:optician_id])
        @patients = Patient.order(:last_name)
    end

    def show
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
        flash[:success] = "New patient successfully added."
        redirect_to patient_path(@patient)
        else
            render :new
        end
    end

    def edit 
    end

    def update
        if @patient.update(patient_params)
            flash[:success] = "This patient was successfully updated."
            redirect_to edit_patient_path(@patient)
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