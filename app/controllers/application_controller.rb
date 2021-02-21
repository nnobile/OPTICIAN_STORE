class ApplicationController < ActionController::Base
    include ApplicationHelper

    private

    def redirect_if_not_logged_in
        if !logged_in?
            flash[:danger] = "You must be logged in to view the page you tried to view."
            redirect_to '/'
        end
    end
end
