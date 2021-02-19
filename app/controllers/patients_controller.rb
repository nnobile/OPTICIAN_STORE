class PatientsController < ApplicationController

    def new
        @patient = Patient.new
    end

    def create
        
    end

    def index
        @patients = Patient.all
    end

    def show
        @patient = Patient.find(params[:id])
    end

    def edit
    end






end
