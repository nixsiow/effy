class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    
    before_filter :authenticate

    private
    def authenticate
        if session[:user_id].present?
            @current_user = User.find session[:user_id]
            session[:user_id] = nil unless @current_user
        end
    end
end
