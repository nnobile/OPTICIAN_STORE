class PatientsController < ApplicationController

    def new
        @patient = Patient.new
    end

    def create
        @patient = Patient.new(patient_params)
        if @patient.save
            redirect_to patient_path(@patient)
        else
            render :new
        end
    end

    end

    def index
        @patients = Patient.order(:last_name)
    end

    def show
        @patient = Patient.find(params[:id])
    end

    def edit
    end

    def destroy
    end


    private

    def patient_params
        params.require(:patient).permit(:first_name, :last_name, :phone_number, :email, :address, :birthdate, :total_revenue, :notes)
    end





end
