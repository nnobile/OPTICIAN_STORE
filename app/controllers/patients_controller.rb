class PatientsController < ApplicationController


    def index
        @patients = Patient.order(:last_name)
    end

    def show
        @patient = Patient.find(params[:id])
    end

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

    def edit
        @patient = Patient.find(params[:id])
    end

    def update
        if @patient.update(patient_params)
            redirect_to patient_path(@patient)
          else
            render 'edit'
          end
        end
    end

    def destroy
        @patient.destroy
        redirect_to optician_index_path
    end


private

    def patient_params
        params.require(:patient).permit(:first_name, :last_name, :phone_number, :email, :address, :birthdate, :total_revenue, :notes)
    end


