module ApplicationHelper

    def current_user
        @current_user ||= Optician.find_by(:id => session[:optician_id]) if session[:optician_id]
    end

    def logged_in?
        !!current_user
    end


end
