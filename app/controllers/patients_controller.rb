class PatientsController < ApplicationController

    def new
        @patient = Patient.new
    end

    def create

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






end
