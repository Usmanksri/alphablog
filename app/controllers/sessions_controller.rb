class SessionsController < ApplicationController

    def new
    end

    def create
        user=User.find_by(email: params[:sessions][:email])
        if user && user.authenticate(params[:sessions][:password])
            session[:user_id]=user.id
            flash[:notice]= "Successfully loggedin"
            redirect_to user
        else
            flash[:notice]= "There are some errors while login, Hint: Credentials"
            redirect_to articles_path
        end

    end

    def destroy
        session[:user_id]=nil
        flash[:notice]="Logged out successfully"
        redirect_to root_path

    end

end