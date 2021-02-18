class OptometristsController < ApplicationController

    def index
        @optometrists = Optometrist.all
    end



end
