class SessionController < ApplicationController
    def new
    end

    def create
        user = User.where(:name => params[:name]).first
        if user.present? && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect_to new_task_path
        else
            session[:user_id] = nil
            flash[:notice] = 'Incorrect username or password. Please try again.'
            redirect_to login_path
        end
    end

    def destroy # logged out
        session[:user_id] = nil
        redirect_to root_path
    end
end
