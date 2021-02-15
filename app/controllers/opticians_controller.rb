class OpticiansController < ApplicationController

    #loading the signup form
    def new
        @optician = Optician.new
    end

    #handling signup
    def create
    end



end
