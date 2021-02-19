class OptometristsController < ApplicationController

    def index
        @optometrists = Optometrist.all
    end

    def show
        @optometrist = Optometrist.find_by(id: params[:id])
    end




end
