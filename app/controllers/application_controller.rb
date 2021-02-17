class ApplicationController < ActionController::Base
    helper_method :current_user

    private 

    def current_user
        @current_user ||= Optician.find_by(:id => session[:optician_id]) if session[:optician_id]
    end

end
