module ApplicationHelper

    def current_user
        @current_user ||= Optician.find_by_id(session[:optician_id]) if session[:optician_id]
    end

    def logged_in?
        !!session[:optician_id]
    end


end
